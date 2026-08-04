import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../data/sources/shares_preference/shared_preference.dart';
import '../routes/route_name.dart';
import 'api_clients.dart';
import 'api_end_points.dart';

/// This interceptor handles authentication errors (like 401) and automatically refreshes the token when needed.
class AuthInterceptor extends Interceptor {
  final Dio dio;

  /// Flag to check if token refresh is already in progress
  static bool _isRefreshing = false;

  /// Completer to hold waiting requests until refresh completes
  static Completer<bool>? _refreshCompleter;

  AuthInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    /// If API returns 401 (Unauthorized)
    /// and it's NOT the refresh token API itself
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != '/${ApiEndpoints.refreshToken}') {
      /// If a refresh is already happening,
      /// wait for it instead of calling again
      if (_isRefreshing) {
        log("Refresh already in progress, waiting...");

        final isSuccess = await _refreshCompleter?.future;

        /// If refresh succeeded → retry original request
        if (isSuccess == true) {
          return handler.resolve(await _retry(err.requestOptions));
        }
      }

      log("401 Error detected. Trying to refresh...");

      /// Mark refresh as in progress
      _isRefreshing = true;
      _refreshCompleter = Completer<bool>();

      /// Call refresh token API
      bool isRefreshed = await _handleTokenRefresh();

      /// Reset refresh state
      _isRefreshing = false;
      _refreshCompleter?.complete(isRefreshed);

      /// If refresh successful → retry original request
      if (isRefreshed) {
        return handler.resolve(await _retry(err.requestOptions));
      } else {
        /// If refresh fails → logout user
        log("Refresh failed. Logging out...");

        await SharedPreferenceData.removeToken();
        await SharedPreferenceData.removeRefreshToken();

        /// Navigate to login screen (currently commented)
        if (navigatorKey.currentState != null) {
          // navigatorKey.currentState!.pushNamedAndRemoveUntil(
          //   RouteName.loginScreen,
          //   (route) => false,
          // );
        }
      }
    }

    /// If not handled → reject request with custom message
    return handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: "Session expired. Please login again.",
        type: DioExceptionType.cancel,
      ),
    );
  }

  /// This function handles the refresh token API call
  /// It gets a new access token using the refresh token
  Future<bool> _handleTokenRefresh() async {
    try {
      log("Refresh Token API call start...");

      /// Get refresh token from local storage
      final refreshToken = await SharedPreferenceData.getRefreshToken();

      /// If no refresh token → cannot refresh
      if (refreshToken == null || refreshToken.isEmpty) {
        log("No refresh token found.");
        return false;
      }

      /// Create a fresh Dio instance (to avoid interceptor loop)
      final freshDio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

      /// Call refresh API
      final response = await freshDio.post(
        '/${ApiEndpoints.refreshToken}',
        data: {"refreshToken": refreshToken},
      );

      /// If success → store new tokens
      if (response.statusCode == 200 && response.data['success'] == true) {
        log("Token Refreshed Successfully!");

        final newToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        /// Save new access token
        await SharedPreferenceData.setToken(newToken);

        /// Save new refresh token (if provided)
        if (newRefreshToken != null) {
          await SharedPreferenceData.setRefreshToken(newRefreshToken);
        }

        /// Update API headers with new token
        await ApiClient.headerSet(newToken);

        return true;
      }

      return false;
    } catch (e) {
      log("Refresh token process failed: $e");
      return false;
    }
  }

  /// This function retries the failed request
  /// after a successful token refresh
  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,

      /// Use updated headers with new token
      headers: ApiClient.headers,
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
