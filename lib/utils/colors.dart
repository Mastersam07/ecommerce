import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Main - Primary color variants
  static const backgroundColor = Color(0xFFF5F6F9);
  static const white = Color(0xFFFFFFFF);
  static const blue = Color(0xFF172133);
  static const kPrimaryColor = Color(0xFFFF7643);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);
}
