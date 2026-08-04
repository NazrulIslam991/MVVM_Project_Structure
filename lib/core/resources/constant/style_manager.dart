import 'package:flutter/material.dart';

import 'font_manager.dart';

/// **************************** Base helper ****************************
TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

/// **************************** LIGHT (F:12, W:300) ****************************
TextStyle lightF12W300({required Color color}) {
  return _getTextStyle(
    FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}

/// **************************** LIGHT (F:14, W:300) ****************************

TextStyle lightF14W300({required Color color}) {
  return _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}

/// **************************** REGULAR (F:12, W:400) ****************************
TextStyle regularF12W400({required Color color}) {
  return _getTextStyle(
    FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.regular400,
    color,
  );
}

/// **************************** REGULAR (F:14, W:400) ****************************
TextStyle regularF14W400({required Color color}) {
  return _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.regular400,
    color,
  );
}

/// **************************** REGULAR (F:16, W:400) ****************************
TextStyle regularF16W400({required Color color}) {
  return _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.regular400,
    color,
  );
}

/// **************************** Medium (F:12, W:500) ****************************
TextStyle mediumF12W500({required Color color}) {
  return _getTextStyle(
    FontSize.s12,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

/// **************************** Medium (F:14, W:500) ****************************
TextStyle mediumF14W500({required Color color}) {
  return _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

/// **************************** Medium (F:16, W:500) ****************************
TextStyle mediumF16W500({required Color color}) {
  return _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

/// **************************** Medium (F:18, W:500) ****************************
TextStyle mediumF18W500({required Color color}) {
  return _getTextStyle(
    FontSize.s18,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

/// **************************** SemiBold (F:14, W:600) ****************************
TextStyle semiBoldF14W600({required Color color}) {
  return _getTextStyle(
    FontSize.s14,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

/// **************************** SemiBold (F:16, W:600) ****************************
TextStyle semiBoldF16W600({required Color color}) {
  return _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

/// **************************** SemiBold (F:18, W:600) ****************************
TextStyle semiBoldF18W600({required Color color}) {
  return _getTextStyle(
    FontSize.s18,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

/// **************************** SemiBold (F:28, W:600) ****************************
TextStyle semiBoldF28W600({required Color color}) {
  return _getTextStyle(
    FontSize.s28,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

/// **************************** Bold (F:16, W:700) ****************************
TextStyle boldF16W700({required Color color}) {
  return _getTextStyle(
    FontSize.s16,
    FontConstants.fontFamily,
    FontWeightManager.bold700,
    color,
  );
}

/// **************************** Bold (F:18, W:700) ****************************
TextStyle boldF18W700({required Color color}) {
  return _getTextStyle(
    FontSize.s18,
    FontConstants.fontFamily,
    FontWeightManager.bold700,
    color,
  );
}

/// **************************** Bold (F:20, W:700) ****************************
TextStyle boldF20W700({required Color color}) {
  return _getTextStyle(
    FontSize.s20,
    FontConstants.fontFamily,
    FontWeightManager.bold700,
    color,
  );
}

/// **************************** Bold (F:24, W:700) ****************************
TextStyle boldF24W700({required Color color}) {
  return _getTextStyle(
    FontSize.s24,
    FontConstants.fontFamily,
    FontWeightManager.bold700,
    color,
  );
}

/// **************************** Bold (F:24, W:800) ****************************
TextStyle boldF24W800({required Color color}) {
  return _getTextStyle(
    FontSize.s24,
    FontConstants.fontFamily,
    FontWeightManager.bold800,
    color,
  );
}

/// **************************** Bold (F:32, W:800) ****************************
TextStyle boldF32W800({required Color color}) {
  return _getTextStyle(
    FontSize.s32,
    FontConstants.fontFamily,
    FontWeightManager.bold800,
    color,
  );
}
