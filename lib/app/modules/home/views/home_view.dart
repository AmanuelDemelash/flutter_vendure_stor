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
        bottomNavigationBar: NavigationBar(destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorite"),
          NavigationDestination(icon: Icon(Icons.shopping_bag), label: "Cart"),
          NavigationDestination(icon: Icon(Icons.person), label: "Account"),
        ]),
        body: CustomScrollView(
          key: const Key("scrol"),
          slivers: [
            const SliverAppBar(
              pinned: true,
              floating: true,
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
            SliverFillRemaining(
              child: ListView(
                padding: const EdgeInsets.all(15),
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
                    width: Get.width,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 10),
                        decoration:
                            const BoxDecoration(color: ColorConstant.iconColor),
                        child: const Column(
                          children: [Text("data")],
                        ),
                      ),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: 7,
                    itemBuilder: (context, index) => const CategoryCard(),
                  ),
                ],
              ),
            )
          ],
        ));
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
