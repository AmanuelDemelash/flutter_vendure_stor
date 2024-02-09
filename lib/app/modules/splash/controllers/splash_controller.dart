import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {

  @override
  void onInit()async {
    super.onInit();
   await Future.delayed(const Duration(seconds: 5),() => Get.toNamed(Routes.GETSTARTED),);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
