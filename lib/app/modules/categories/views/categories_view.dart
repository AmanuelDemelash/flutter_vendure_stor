import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/colorConstant.dart';
import '../../home/views/home_view.dart';
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
        title: const TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              filled: false,
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search,
                color: ColorConstant.iconColor,
                size:30,
              )),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.safety_check_outlined),
                                Text("Tshert")
                              ],
                            ),
                          ),
                        ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(child:ListView.builder(itemBuilder:(context, index) =>
                        ExpansionTile(title:Text("data"),
                        children: [
                          Container(
                            height: 100,
                          )
                        ],
                        ),))

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
