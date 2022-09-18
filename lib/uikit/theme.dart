import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff4e42aa)),
      headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
      headline3: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
      bodyText1: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
    ),
  );
}
