import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<String> productDescMenu =
      RxList<String>(["Items", "Details", "Reviews"]);
  RxInt selectedIndex = 0.obs;
  RxInt selectedVariant = 0.obs;

  Rx<Map<String, dynamic>> productDetail = Rx<Map<String, dynamic>>({});
  Rx<List<dynamic>> productVariants = Rx<List<dynamic>>([]);
  RxList<String> category = RxList<String>([]);
  RxList<String> brand = RxList<String>([]);

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

  getAllVariantInfo() async {
    productVariants.value = productDetail.value["product"]["variants"];
    for (var element in productDetail.value["product"]["facetValues"]) {
      if (element["facet"]["name"] == "category") {
        category.value.add(element["name"]);
      } else if (element["facet"]["name"] == "brand") {
        brand.value.add(element["name"]);
      }
    }
  }
}
