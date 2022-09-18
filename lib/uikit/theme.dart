import 'package:flutter/material.dart';

ThemeData mainTheme() {
  return ThemeData(
    backgroundColor: const Color(0xff6b5be2),
    cardColor: const Color(0xffe9e5fb),
    shadowColor: const Color(0xff4e42aa),
    errorColor: const Color(0xfffe6781),
    hintColor: const Color(0xff59d7bb),
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