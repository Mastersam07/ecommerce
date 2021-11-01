import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      color: Color(0xFFF5F6F9),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
    ),
    primaryColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: Color(0xFFF5F6F9),
    splashColor: Colors.transparent,
    brightness: Brightness.light,
    highlightColor: Colors.transparent,
    dividerColor: Colors.transparent,
    fontFamily: 'Muli',
    cardColor: AppColors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        fontFamily: 'Muli',
      ),
      headline2: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        fontFamily: 'Muli',
      ),
      headline3: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
      headline4: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
      button: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
      subtitle1: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
      subtitle2: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Muli',
      ),
    ),
  );
}
