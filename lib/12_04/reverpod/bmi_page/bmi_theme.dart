import 'package:flutter/material.dart';

final lightTheme1204 = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pinkAccent,
    brightness: Brightness.light,
  ),
  dividerColor: Colors.black38,
  highlightColor: Colors.pinkAccent,
  sliderTheme: SliderThemeData(
    thumbColor: Colors.pinkAccent,
    activeTrackColor: Colors.black38,
    inactiveTrackColor: Colors.black38,
    trackHeight: 1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      side: WidgetStatePropertyAll(BorderSide(color: Colors.black38)),
      foregroundColor: WidgetStatePropertyAll(Colors.black38),
    ),
  ),
  useMaterial3: true,
);

final dartTheme1204 = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.pinkAccent,
    brightness: Brightness.dark,
  ),
  disabledColor: Colors.white38,
  highlightColor: Colors.pinkAccent,
  sliderTheme: SliderThemeData(
    thumbColor: Colors.pinkAccent,
    activeTrackColor: Colors.white38,
    inactiveTrackColor: Colors.white38,
    trackHeight: 1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  useMaterial3: true,
);
