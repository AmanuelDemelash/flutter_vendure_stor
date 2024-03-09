import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colorConstant.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  RxBool showPassword = false.obs;
  RxBool isLogging = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> cheekLogin(Map<String, dynamic> data) async {
    if (data["login"]["message"] != null) {
      Get.snackbar("Login error", data["login"]["message"],
          backgroundColor: ColorConstant.backgroundColor,
          colorText: Colors.red);
      isLogging.value = false;
    }
    if (data["login"]["id"] != null) {
      Get.snackbar("Login Succesfull", "",
          backgroundColor: ColorConstant.backgroundColor,
          colorText: Colors.green);
      isLogging.value = false;
      Get.offAllNamed(Routes.HOME);
    }
  }
}
