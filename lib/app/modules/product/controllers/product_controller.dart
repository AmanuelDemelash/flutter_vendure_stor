import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<String> productDescMenu =
      RxList<String>(["Items", "Details", "Reviews"]);
  RxInt selectedIndex = 0.obs;

  Rx<Map<String, dynamic>> productDetail = Rx<Map<String, dynamic>>({});

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
}
