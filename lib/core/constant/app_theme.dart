import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';




ThemeData themeEnglish = ThemeData(
  appBarTheme:  const AppBarTheme(
          centerTitle: true,
        elevation: 0,
                iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColor.primaryColr ,
         titleTextStyle: TextStyle(
          color: AppColor.white , 
          fontWeight: FontWeight.bold ,
          fontFamily: "Cairo",
           fontSize: 25)
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColr),
  fontFamily: 'PlayfairDisplay',
  textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: 'Cairo',
  textTheme: TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 27, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: Colors.blue,
);
