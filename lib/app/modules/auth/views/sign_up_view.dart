import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colorConstant.dart';

class SignUpView extends GetView {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/back.jpg"),fit: BoxFit.fill)
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            color: ColorConstant.primeryColor.withOpacity(0.7),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            margin:const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed:() => Get.back(), icon:const Icon(Icons.arrow_back_ios,color: ColorConstant.iconColor,)),

              ],
            ),

          )
        ],
      )
    );
  }
}
