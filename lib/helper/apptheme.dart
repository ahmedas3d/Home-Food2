import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData themeEnglish = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
        fontFamily: "Cairo"),
    bodyLarge: TextStyle(
        height: 2,  fontSize: 14, fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.normal,
        fontFamily: "Cairo",
        fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  useMaterial3: true,
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo"),
    displayMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo"),
    bodyLarge: TextStyle(
        height: 2, fontSize: 14, fontFamily: "Cairo"),
    bodyMedium: TextStyle(
        height: 2,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: "Cairo"),
  ),
  primarySwatch: Colors.blue,
);
