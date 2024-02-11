import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';

ThemeData light = ThemeData(
  primaryColor: ColorConstant.primeryColor,
  scaffoldBackgroundColor: ColorConstant.backgroundColor,
  colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.primeryColor),
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'aappfont',
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: ColorConstant.primeryColor,
          elevation: 10,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)))),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
