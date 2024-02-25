import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/data/query/dart/query.dart';
import 'package:flutter_vendure_stor/app/modules/categories/controllers/categories_controller.dart';
import 'package:flutter_vendure_stor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../constants/colorConstant.dart';

class CategoriDetailView extends GetView<CategoriesController> {
  CategoriDetailView({Key? key}) : super(key: key);

  var category = Get.arguments;

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                category["name"],
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
                    category["slug"],
                    style: const TextStyle(color: ColorConstant.secondryColor),
                  ),
                ],
              ),
            ),
            //sub category
            Query(
              options: QueryOptions(
                  document: gql(QueryApp.categoryOfSelectedCollection),
                  variables: {"slug": category["slug"]}),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (result.hasException) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (result.data!.isEmpty) {
                  return const Center(
                    child: Text("No product found"),
                  );
                }
                return result.data?["collection"]["children"].length == 0
                    ? SizedBox(
                        width: Get.width,
                        height: 12,
                      )
                    : SizedBox(
                        height: 75,
                        width: Get.width,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(left: 10),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                result.data?["collection"]["children"].length,
                            itemBuilder: (context, index) =>
                                ChildCollectionCart(
                                  image: result.data?["collection"]["children"]
                                      [index]["featuredAsset"]["preview"],
                                  name: result.data?["collection"]["children"]
                                      [index]["name"],
                                )),
                      );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //category products
            Expanded(
                child: Query(
              options: QueryOptions(
                  document: gql(QueryApp.getCollectionProducts),
                  variables: {
                    "slug": category["slug"],
                    "skip": 0,
                  }),
              builder: (result, {fetchMore, refetch}) {
                if (result.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (result.hasException) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (result.data!.isEmpty) {
                  return const Center(
                    child: Text("No product found"),
                  );
                }
                return GridView.builder(
                    padding: const EdgeInsets.all(15),
                    controller: ScrollController(),
                    physics: const BouncingScrollPhysics(),
                    itemCount: result.data?["search"]["totalItems"],
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) => CollectionProductCart(
                          image: result.data?["search"]["items"][index]
                              ["productAsset"]["preview"],
                          name: result.data?["search"]["items"][index]
                              ["productName"],
                          min: result.data!["search"]["items"][index]
                              ["priceWithTax"]["min"],
                          max: result.data!["search"]["items"][index]
                              ["priceWithTax"]["max"],
                          slug: result.data!["search"]["items"][index]["slug"],
                        ));
              },
            ))
          ],
        ));
  }
}

class CollectionProductCart extends StatelessWidget {
  CollectionProductCart(
      {super.key,
      required this.image,
      required this.name,
      required this.min,
      required this.max,
      required this.slug});

  String image;
  String name;
  int min;
  int max;
  String slug;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () async {
          Get.toNamed(Routes.PRODUCT, arguments: slug);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: slug,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: image,
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 3, right: 10),
              child: Text(
                name,
                maxLines: 1,
                style: const TextStyle(
                  color: ColorConstant.secondryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 1),
              child: min == max
                  ? Text(
                      (min / 100).toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          color: ColorConstant.secondryColor,
                          fontWeight: FontWeight.bold),
                    )
                  : Row(
                      children: [
                        Text(
                          (min / 100).toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: ColorConstant.secondryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(" - "),
                        Text(
                          (max / 100).toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              color: ColorConstant.secondryColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChildCollectionCart extends StatelessWidget {
  ChildCollectionCart({super.key, required this.image, required this.name});

  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 75,
        height: 70,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //     color: ColorConstant.primeryColor,
          //     width: 1)
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                placeholder: (context, url) => const Icon(
                  Icons.image,
                  color: ColorConstant.iconColor,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor.withOpacity(0.7),
                ),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, color: ColorConstant.secondryColor),
                ),
              ),
            )
          ],
        ));
  }
}
