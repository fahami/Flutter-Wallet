import 'package:flutter/material.dart';

const Color kAccentColor = Color(0xffE1C06E);
const Color kPrimaryColor = Color(0xff828286);
const Color kSecondaryColor = Color(0xff2A2A2D);
const EdgeInsets kScreenPadding =
    EdgeInsets.symmetric(horizontal: 16, vertical: 24);

ThemeData appTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    backgroundColor: Colors.white,
    colorScheme: ColorScheme.light().copyWith(
      primary: kPrimaryColor,
      secondary: kAccentColor,
    ),
    appBarTheme: AppBarTheme(
      color: kAccentColor,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: kAccentColor,
      selectionColor: kAccentColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
