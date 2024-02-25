import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';
import 'package:flutter_vendure_stor/app/data/query/dart/query.dart';
import 'package:flutter_vendure_stor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);

  String slug = Get.arguments;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: const Text("Product detail"),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: ColorConstant.iconColor,
              )),
          actions: const [
            Badge(
                alignment: Alignment.topRight,
                backgroundColor: ColorConstant.primeryColor,
                smallSize: 30,
                offset: Offset(5, -3),
                label: Text("3"),
                child: Icon(
                  Icons.notifications,
                  color: ColorConstant.iconColor,
                )),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Query(
              options: QueryOptions(
                  document: gql(QueryApp.ProductDetail),
                  variables: {"slug": slug}),
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
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                          padding: const EdgeInsets.all(10),
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                      result.data!["product"]["assets"].length,
                                      (index) => Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 2),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: result.data!["product"]
                                                ["assets"][index]["preview"],
                                            placeholder: (context, url) =>
                                                const Icon(
                                              Icons.image,
                                              color: ColorConstant.iconColor,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Hero(
                                      tag: slug,
                                      child: Container(
                                        width: Get.width,
                                        margin: const EdgeInsets.all(10),
                                        height: 230,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: result.data!["product"]
                                                ["featuredAsset"]["preview"],
                                            placeholder: (context, url) =>
                                                const Icon(
                                              Icons.image,
                                              color: ColorConstant.iconColor,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            fit: BoxFit.cover,
                                            width: Get.width,
                                            height: 200,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${result.data!["product"]["variants"][0]["priceWithTax"] / 100} " +
                                      result.data!["product"]["variants"][0]
                                          ["currencyCode"],
                                  style: const TextStyle(
                                      fontSize: 23,
                                      color: ColorConstant.primeryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                RatingBar.builder(
                                  glow: true,
                                  itemSize: 15,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: ColorConstant.primeryColor,
                                  ),
                                  onRatingUpdate: (rating) {},
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  result.data!["product"]["name"],
                                  style: const TextStyle(
                                      color: ColorConstant.secondryColor),
                                ),
                                Row(
                                  children: [
                                    Text('20 sold'),
                                    Divider(
                                      thickness: 1,
                                      color: ColorConstant.primeryColor,
                                      height: 20,
                                    ),
                                    Text(
                                      "In stock",
                                      style: TextStyle(
                                          color: ColorConstant.primeryColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Description",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            Text(result.data!["product"]["description"]),
                            Divider(
                              thickness: 1,
                              color:
                                  ColorConstant.primeryColor.withOpacity(0.2),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      controller.productDescMenu.length,
                                      (index) => GestureDetector(
                                            onTap: () async {
                                              controller.selectedIndex.value =
                                                  index;
                                              _pageController.jumpToPage(index);
                                            },
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  microseconds: 10),
                                              padding: const EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 7,
                                                  top: 7),
                                              margin: const EdgeInsets.only(
                                                  right: 7),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: controller.selectedIndex
                                                            .value ==
                                                        index
                                                    ? ColorConstant.primeryColor
                                                        .withOpacity(0.1)
                                                    : ColorConstant
                                                        .backgroundColor,
                                              ),
                                              child: Text(
                                                controller
                                                    .productDescMenu[index],
                                                style: TextStyle(
                                                    fontSize: controller
                                                                .selectedIndex
                                                                .value ==
                                                            index
                                                        ? 15
                                                        : 12,
                                                    color: controller
                                                                .selectedIndex
                                                                .value ==
                                                            index
                                                        ? ColorConstant
                                                            .primeryColor
                                                        : ColorConstant
                                                            .secondryColor
                                                            .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ))),
                            ),
                            //indexed stack
                            SizedBox(
                              width: Get.width,
                              height: Get.height / 2,
                              child: PageView(
                                controller: _pageController,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (value) {
                                  controller.selectedIndex.value = value;
                                },
                                children: [
                                  AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 100),
                                      width: Get.width,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: result
                                            .data!["product"]["variants"]
                                            .length,
                                        itemBuilder: (context, index) =>
                                            ListTile(
                                          leading: Checkbox.adaptive(
                                            value: true,
                                            onChanged: (value) {},
                                          ),
                                          title: Text(result.data!["product"]
                                              ["variants"][index]["name"]),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text("Price"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      (result.data!["product"][
                                                                          "variants"]
                                                                      [index][
                                                                  "priceWithTax"] /
                                                              100)
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: ColorConstant
                                                              .primeryColor)),
                                                  Text(
                                                    " " +
                                                        result.data!["product"]
                                                                    ["variants"]
                                                                [index]
                                                            ["currencyCode"],
                                                    style: const TextStyle(
                                                        color: ColorConstant
                                                            .primeryColor),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          trailing: Text(result.data!["product"]
                                                  ["variants"][index]
                                              ["stockLevel"]),
                                        ),
                                      )),
                                  AnimatedContainer(
                                    duration: const Duration(microseconds: 100),
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: const [
                                        ListTile(
                                          title: Text("Brand"),
                                          subtitle: Text("Nike"),
                                          trailing: Column(
                                            children: [
                                              Text("SKU"),
                                              Text("sd223r3665618")
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("Brand"),
                                          subtitle: Text("Nike"),
                                          trailing: Column(
                                            children: [
                                              Text("SKU"),
                                              Text("sd223r3665618")
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("Brand"),
                                          subtitle: Text("Nike"),
                                          trailing: Column(
                                            children: [
                                              Text("SKU"),
                                              Text("sd223r3665618")
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: const Duration(microseconds: 20),
                                    width: Get.width,
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 5,
                                      itemBuilder: (context, index) => ListTile(
                                        leading: const CircleAvatar(
                                          radius: 20,
                                        ),
                                        title: const Text("andrew"),
                                        subtitle: const Text(
                                          "review message from customer",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        trailing: Column(
                                          children: [
                                            Text(
                                                DateTime.now().year.toString()),
                                            RatingBar.builder(
                                              glow: true,
                                              itemSize: 10,
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color:
                                                    ColorConstant.primeryColor,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              //  IndexedStack(
                              //   key: Key(
                              //       controller.selectedIndex.value.toString()),
                              //   index: controller.selectedIndex.value,

                              // ),
                            )
                          ]),
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          ColorConstant.backgroundColor,
                                      side: const BorderSide(
                                          color: ColorConstant.primeryColor)),
                                  onPressed: () => Get.toNamed(Routes.CART),
                                  child: const Text("Add To Cart")),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: SizedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(elevation: 0),
                                  onPressed: () {},
                                  child: const Text(
                                    "Buy Now",
                                    style: TextStyle(
                                        color: ColorConstant.backgroundColor),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
