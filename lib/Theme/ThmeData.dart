import 'package:flutter/material.dart';
enum AnimationType {
  FADE_ANIMATED_THEME,
  SCALE_ANIMATED_THEME,
  CIRCULAR_ANIMATED_THEME,
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  accentColor: Colors.greenAccent,
  bottomAppBarColor: Colors.greenAccent,
  hintColor: Colors.grey,
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.white,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  accentColor: Colors.blueAccent,
  hintColor: Colors.deepOrangeAccent,
  bottomAppBarColor: Colors.grey,
  textTheme: TextTheme(
    subtitle1: TextStyle(
      color: Colors.white,
    ),
  ),
);