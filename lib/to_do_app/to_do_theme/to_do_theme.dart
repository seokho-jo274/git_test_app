// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey,
    onPrimary: Colors.black,

    secondary: Colors.deepOrange,
    onSecondary: Colors.white,

    surface: Colors.white,
    onSurface: Colors.black87,

    error: Colors.red,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.grey[300],
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,

  colorScheme: ColorScheme.dark(
    primary: Colors.black, // 주요 텍스트/아이콘
    onPrimary: Colors.black,

    surface: Colors.grey, // 리스트 아이템 배경
    onSurface: Colors.white,

    background: Colors.black, // 전체 배경
    onBackground: Colors.white,

    secondary: Colors.deepOrange, // FAB 오렌지
    onSecondary: Colors.white,
  ),
  iconTheme: IconThemeData(color: Colors.black),

  scaffoldBackgroundColor: Colors.black,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
    foregroundColor: Colors.black,
  ),
);
