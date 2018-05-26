import 'package:flutter/material.dart';

class ThemeFactory {
  static ThemeData getMainTheme() {
    return new ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFF16654),
        accentColor: Colors.white,
        fontFamily: 'Quicksand',
        textTheme: new TextTheme(
          // For Block Title
          display1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(180, 0, 0, 0)
          ),
          // For Content Title
          display2: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(180, 0, 0, 0)
          ),
        ),
        disabledColor: Colors.black38
    );
  }
}
