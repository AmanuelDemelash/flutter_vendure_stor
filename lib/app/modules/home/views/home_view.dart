import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 10,
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: 20,
          ),
        ],
        title: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: false,
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: ColorConstant.iconColor,
              )),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        addAutomaticKeepAlives: true,
        children: [
          const SizedBox(
            height: 15,
          ),
          const HomePageCarousel(),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Exclusive deal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.secondryColor),
                ),
              ),
              Text("view all")
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 240,
            width: Get.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => ProductCard(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.secondryColor),
                ),
              ),
              Text("view all")
            ],
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: 7,
            itemBuilder: (context, index) => const CategoryCard(),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2 - 20,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              placeholder: (context, url) => const Icon(
                Icons.image,
                color: ColorConstant.iconColor,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: Get.width,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 6),
            child: Row(
              children: [
                Text(
                  "\$234",
                  style: TextStyle(
                      color: ColorConstant.secondryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "\$432",
                  style: TextStyle(
                      color: ColorConstant.primeryColor,
                      decoration: TextDecoration.lineThrough),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 3, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "smart watch",
                  style: TextStyle(color: ColorConstant.secondryColor),
                ),
                Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: ColorConstant.primeryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Row(
                      children: [
                        Text(
                          "3.5",
                          style: TextStyle(
                              fontSize: 11,
                              color: ColorConstant.backgroundColor),
                        ),
                        Icon(
                          Icons.star,
                          color: ColorConstant.backgroundColor,
                          size: 10,
                        )
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0, padding: const EdgeInsets.all(1)),
                  child: const Text(
                    "Add To Cart",
                    style: TextStyle(color: ColorConstant.backgroundColor),
                  )))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: ColorConstant.primeryColor.withOpacity(0.1)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.watch,
            color: ColorConstant.primeryColor,
            size: 35,
          ),
          Text("Watch")
        ],
      ),
    );
  }
}

class HomePageCarousel extends StatelessWidget {
  const HomePageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              placeholder: (context, url) => const Icon(
                Icons.image,
                color: ColorConstant.iconColor,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
              width: Get.width,
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Super flash sale",
                  style: TextStyle(
                      fontSize: 20, color: ColorConstant.backgroundColor),
                ),
                const Text(
                  "50% Off",
                  style: TextStyle(
                      fontSize: 20, color: ColorConstant.backgroundColor),
                ),
                Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: ColorConstant.backgroundColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: const Text("see more"))
              ],
            ),
          )
        ],
      ),
      options: CarouselOptions(
          height: 130,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal),
    );
  }
}
