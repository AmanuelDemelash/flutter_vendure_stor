import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final selectedSubCategory = 0.obs;
  RxString subCategorySlug = "".obs;
  RxList<dynamic> subCategorys = RxList<dynamic>([]);

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
