import 'package:get/get.dart';

class ProductController extends GetxController {

  RxList<String> productDescMenu=RxList<String>(["Product","Details","Reviews"]);
  RxInt selectedIndex=0.obs;
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
