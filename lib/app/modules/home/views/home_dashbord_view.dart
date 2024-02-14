import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colorConstant.dart';
import '../../../routes/app_pages.dart';

class HomeDashbordView extends GetView {
  const HomeDashbordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        actions: const [
          Badge(
              alignment: Alignment.topRight,
              backgroundColor: ColorConstant.primeryColor,
              smallSize: 30,
              offset: Offset(5,-3),
              label: Text("3"),
              child: Icon(Icons.notifications,color: ColorConstant.iconColor,)),
          SizedBox(
            width: 20,
          ),
        ],
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
                  size:30,
                )),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        padding: const EdgeInsets.all(15),
        addAutomaticKeepAlives: true,
        children: [
          const Text("New Arrival",style: TextStyle(color: ColorConstant.secondryColor, fontWeight: FontWeight.bold,),),
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
              Text("view all",style: TextStyle(color: ColorConstant.secondryColor,),)
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
              itemBuilder: (context, index) => const ProductCard(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  "Categories",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.secondryColor),
                ),
              ),
              GestureDetector(
                  onTap: () => Get.toNamed(Routes.CATEGORIES),
                  child:const Text("view all"))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
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
          Expanded(
            child: ClipRRect(
              borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              child: CachedNetworkImage(
                imageUrl:
                "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                placeholder: (context, url) => const Icon(
                  Icons.image,
                  color: ColorConstant.iconColor,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: Get.width,
                height:150,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 6),
            child: Row(
              children: [
                Text(
                  "\$234",
                  style: TextStyle(
                      fontSize:15,
                      color: ColorConstant.secondryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
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
                const Expanded(
                  child: Text(
                    "smart watch",   style: TextStyle(
                      fontSize:15,
                      color: ColorConstant.secondryColor,
                      fontWeight: FontWeight.w200),
                  ),
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
      BoxDecoration(color: ColorConstant.primeryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10)
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.watch,
            color: ColorConstant.primeryColor,
            size: 35,
          ),
          Text("Watch",style: TextStyle(fontSize: 12),)
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
              Container(
                width: Get.width,
                height: Get.height,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)

                ),
              ),
              Positioned(
                top: 5,
                left: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Super flash sale",
                      style: TextStyle(
                          fontSize: 25, color: ColorConstant.backgroundColor),
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
                        child: const Text("see more",style: TextStyle(fontSize: 11),))
                  ],
                ),
              )
            ],
          ),
      options: CarouselOptions(
          height: 130,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
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
