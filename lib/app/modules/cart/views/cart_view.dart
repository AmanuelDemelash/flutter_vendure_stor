import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Cart',style: TextStyle(fontSize: 27),),
        centerTitle: false,
        elevation: 0,
        excludeHeaderSemantics:false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder:(context, index) =>
                  SizedBox(
                    width: Get.width,
                    child: Card(
                      margin:const EdgeInsets.all(10),
                      color: ColorConstant.iconColor,
                      elevation: 10,
                      shadowColor: ColorConstant.primeryColor.withOpacity(0.1),
                    ),
                  ) ,
            ),
          ),
          Container(
            width: Get.width,
            height: 200,
            padding:const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConstant.primeryColor.withOpacity(0.2),
                        hintText: "promo code hear",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  Text("Apply")
                ],)

              ],
            ),

          )
        ],
      )
    );
  }
}
