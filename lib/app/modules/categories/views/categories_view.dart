import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colorConstant.dart';
import '../controllers/categories_controller.dart';

class CategoriesView extends GetView<CategoriesController> {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () => Get.back(), icon:const Icon(Icons.arrow_back_ios,color: ColorConstant.iconColor,)),
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
        title:ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextField(
            decoration: InputDecoration(
               border: InputBorder.none,
                filled: true,
                fillColor: ColorConstant.primeryColor.withOpacity(0.07),
                hintText: "Search",
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorConstant.iconColor,
                  size:30,
                )),
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 11,top: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("All Categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: ColorConstant.secondryColor),),
            Expanded(
              child: Container(
                width: Get.width,
                height: Get.height,
                margin:const EdgeInsets.only(top:15,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width:100,
                      height: Get.height,
                      decoration:const BoxDecoration(
                       // color: ColorConstant.secondryColor
                      ),
                      child: ListView.builder(
                        itemCount:60,
                        itemBuilder:(context, index) =>Container(
                            width: 90,
                            height: 100,
                            margin:const EdgeInsets.only(bottom:5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstant.primeryColor.withOpacity(0.1)
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.safety_check_outlined,color: ColorConstant.primeryColor,),
                                Text("Tshert")
                              ],
                            ),
                          ),
                        ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(child:ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:2,
                        itemBuilder:(context, index) =>
                        ExpansionTile(title:const Text("data"),
                        children: [
                         SizedBox(
                           width:Get.width,
                           height: Get.height,
                           child: GridView.builder(
                             gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                               itemCount: 15,
                               itemBuilder:(context, index) =>
                                    Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         mainAxisAlignment: MainAxisAlignment.start,
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
                                                 height:100,
                                               ),
                                             ),
                                           ),
                                           const Text("name"),
                                           const Text("\$324"),


                                         ],
                                       ),


                         )
                         )
                        ],
                        ),
                    ))

                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
