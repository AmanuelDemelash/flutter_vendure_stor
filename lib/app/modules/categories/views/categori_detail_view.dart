import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/modules/categories/controllers/categories_controller.dart';

import 'package:get/get.dart';

import '../../../constants/colorConstant.dart';

class CategoriDetailView extends GetView<CategoriesController> {
  const CategoriDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //sub category
          Container(
            width: 100,
            height: Get.height,
            margin:const EdgeInsets.all(10),
            padding:const EdgeInsets.all(4),
            child: ListView.builder(
              itemCount:3,
              itemBuilder:(context, index) => Container(
              width: 90,
              height: 90,
              margin:const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: ColorConstant.primeryColor,
                  borderRadius: BorderRadius.circular(10)

                ),
            ),),
          ),
          //products
          Expanded(
              child:GridView.builder(
                padding:const  EdgeInsets.only(top: 10),
                controller: ScrollController(),
                //physics:const BouncingScrollPhysics(),
                itemCount: 11,
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10)
                  ,itemBuilder:(context, index) =>
                   SizedBox(
                  width: 200,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height:100,
                        margin:const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
color: ColorConstant.secondryColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      Text("Name "),
                      Text("Price")
                    ],
                  ),
                ),
                ))

        ],
      )
    );
  }
}
