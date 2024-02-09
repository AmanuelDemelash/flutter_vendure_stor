import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/theme.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      theme: light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    ),
  );
}
