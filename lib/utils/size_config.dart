import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/navigation/app_navigator.dart';

import '../locator.dart';

class SizeConfig {
  static BuildContext? appContext;
  static MediaQueryData? _mediaQueryData;
  static double? _designHeight;
  static const double _designWidth = 414.0;
  static double? devicePixelRatio;
  static late double screenWidth;
  static late double screenHeight;
  static Orientation? orientation;

  static void init(
    BuildContext context, {
    double pageHeight = 736.0,
  }) {
    _mediaQueryData = MediaQuery.of(context);
    appContext = context;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    _designHeight = pageHeight;
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }

  static void ensureInitialized() {
    final key = locator<NavigationService>();
    if (appContext == null || _mediaQueryData == null) {
      appContext = key.navigationKey.currentContext;
      _mediaQueryData = MediaQuery.of(appContext!);
      devicePixelRatio = MediaQuery.of(appContext!).devicePixelRatio;
    }
  }

  static double height(double height) {
    ensureInitialized();
    final screenHeight = _mediaQueryData!.size.height / _designHeight!;
    return height * screenHeight;
  }

  static double width(double width) {
    ensureInitialized();
    final screenWidth = _mediaQueryData!.size.width / _designWidth;
    return width * screenWidth;
  }

  static double textSize(double textSize) {
    ensureInitialized();
    final textRatio = _mediaQueryData!.size.width / _designWidth;
    return textSize * textRatio;
  }
}
