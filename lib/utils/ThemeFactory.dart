import 'package:flutter/material.dart';

class ThemeFactory {
  static ThemeData getMainTheme() {
    return new ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFF16654),
        accentColor: Colors.white,
        fontFamily: 'Quicksand'
    );
  }
}
