import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/data/query/dart/query.dart';
import 'package:flutter_vendure_stor/app/modules/categories/controllers/categories_controller.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../constants/colorConstant.dart';

class CategoriDetailView extends GetView<CategoriesController> {
  CategoriDetailView({Key? key}) : super(key: key);

  var categoryId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(
      () => CategoriesController(),
    );
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: ColorConstant.primeryColor.withOpacity(0.03),
                  hintText: "Search",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ColorConstant.iconColor,
                    size: 30,
                  )),
            ),
          ),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorConstant.iconColor,
              )),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.filter_list_alt,
                color: ColorConstant.iconColor,
              ),
              onPressed: () => Get.bottomSheet(BottomSheet(
                onClosing: () {},
                builder: (context) => Container(),
              )),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Query(
          options: QueryOptions(
              document: gql(QueryApp.category), variables: {'id': categoryId}),
          builder: (result, {fetchMore, refetch}) {
            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.hasException) {
              return const Center(child: CircularProgressIndicator());
            }
            if (result.data!.isNotEmpty) {}

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    result.data?["collection"]["name"],
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ColorConstant.secondryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    children: [
                      const Text("Slug:  "),
                      Text(
                        result.data?["collection"]["slug"],
                        style:
                            const TextStyle(color: ColorConstant.secondryColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width,
                  height: result.data?["collection"]["children"].length == 0
                      ? 1
                      : 120,
                  padding: const EdgeInsets.only(left: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: result.data?["collection"]["children"].length,
                      itemBuilder: (context, index) => Obx(
                            () => GestureDetector(
                              onTap: () =>
                                  controller.selectedSubCategory.value = index,
                              child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 60),
                                  width: controller.selectedSubCategory.value ==
                                          index
                                      ? 100
                                      : 80,
                                  height:
                                      controller.selectedSubCategory.value ==
                                              index
                                          ? 100
                                          : 40,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: ColorConstant.primeryColor,
                                          width: 2)),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: result.data?["collection"]
                                                  ["children"][index]
                                              ["featuredAsset"]["preview"],
                                          placeholder: (context, url) =>
                                              const Icon(
                                            Icons.image,
                                            color: ColorConstant.iconColor,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.cover,
                                          width: 90,
                                          height: 90,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 30,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: ColorConstant.backgroundColor
                                                .withOpacity(0.7),
                                          ),
                                          child: Text(
                                            result.data?["collection"]
                                                ["children"][index]["name"],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: ColorConstant
                                                    .secondryColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          )),
                ),
                Expanded(
                    child: GridView.builder(
                  padding: const EdgeInsets.only(right: 12, left: 10),
                  controller: ScrollController(),
                  //physics:const BouncingScrollPhysics(),
                  itemCount: result.data?["collection"]["productVariants"]
                      ["totalItems"],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: result.data?["collection"]
                                        ["productVariants"]["items"][index]
                                    ["product"]["featuredAsset"]["preview"],
                                placeholder: (context, url) => const Icon(
                                  Icons.image,
                                  color: ColorConstant.iconColor,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                                width: 200,
                                height: 110,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 3, right: 10),
                          child: Text(
                            result.data?["collection"]["productVariants"]
                                ["items"][index]["name"],
                            maxLines: 1,
                            style: const TextStyle(
                              color: ColorConstant.secondryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 1),
                          child: Row(
                            children: [
                              Text(
                                (result.data?["collection"]["productVariants"]
                                            ["items"][index]["priceWithTax"] /
                                        100)
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: ColorConstant.secondryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "\$432",
                                style: TextStyle(
                                    color: ColorConstant.primeryColor,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            );
          },
        ));
  }
}
