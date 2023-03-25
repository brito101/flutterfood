// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: Color.fromRGBO(147, 70, 248, 1),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.black, brightness: Brightness.dark)
      .copyWith(background: Colors.white),
);

final ThemeData themeDataDark = ThemeData(
  primaryColor: Color.fromRGBO(147, 70, 248, 1),
  colorScheme: ColorScheme.fromSwatch()
      .copyWith(secondary: Colors.white, brightness: Brightness.dark)
      .copyWith(background: Colors.black),
);
