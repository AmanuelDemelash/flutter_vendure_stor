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
      body: CustomScrollView(
        key: const Key("scrol"),
        slivers: [
          const SliverAppBar(
            pinned: true,
            floating: true,
            elevation: 0,
            scrolledUnderElevation:10,
            automaticallyImplyLeading: false,
            actions: [
              Icon(Icons.notifications),
              SizedBox(width: 20,),
            ],
            title: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: false,
                hintText: "Search",
                prefixIcon: Icon(Icons.search,color: ColorConstant.iconColor,)
              ),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const Text("New Arrival",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15,),
                  const HomePageCarousel(),
                  const SizedBox(height:10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exclusive deal",style: TextStyle(fontWeight: FontWeight.bold,color: ColorConstant.secondryColor),),
                      Text("view all")
                    ],
                  ),
                  SizedBox(
                    width:Get.width,
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder:(context, index) =>
                          Container(
                            width: 200,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                              color: ColorConstant.iconColor
                            ),
                            child: const Column(
                              children: [
                                Text("data")
                              ],
                            ),

                      ) ,),

                  )




                ],
              ),
            )
          )
        ],
      )
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
          children: [
            SizedBox(
              width: Get.width,
              child:
              CachedNetworkImage(
                imageUrl: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                placeholder: (context, url) =>const Icon(Icons.image,color: ColorConstant.iconColor,),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: Get.width,
              ),

            ),
            const Positioned(
              top: 5,
              left: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Super flash sale",style: TextStyle(fontSize: 17),),
                  Text("see more")
                ],
              ),
            )
          ],
        ),
        options: CarouselOptions(
            height: 130,
            aspectRatio: 16/9,
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
            scrollDirection: Axis.horizontal
    
        ),
      );
  }
}
