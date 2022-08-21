import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:huubap_task/common/enum.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themeData = lightTheme;
  late bool _isDarkMode = false;

  static final darkTheme = ThemeData(
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      hintColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        titleTextStyle:
            TextStyle(color: Colors.white, fontSize: Adaptive.sp(22)),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      primarySwatch: Colors.grey,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
      textTheme: TextTheme(
          bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold)));

  static final lightTheme = ThemeData(
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.blue),
    ),
    hintColor: Colors.grey,
    appBarTheme: AppBarTheme(
        titleTextStyle:
            TextStyle(color: Colors.white, fontSize: Adaptive.sp(22)),
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.blue),
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    dividerColor: Colors.white54,
  );

  ThemeData getTheme() => _themeData;

  set changeTheme(ThemeType theme) {
    if (theme == ThemeType.DarkTheme) {
      _themeData = darkTheme;
      _isDarkMode = true;
      notifyListeners();
    } else if (theme == ThemeType.LightTheme) {
      _themeData = lightTheme;
      _isDarkMode = false;
      notifyListeners();
    }
  }

  get themeType => _isDarkMode;
}
