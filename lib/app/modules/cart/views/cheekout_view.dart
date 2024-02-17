import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';

import 'package:get/get.dart';

class CheekOutView extends GetView {
  const CheekOutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:const Text("CheekOut",style: TextStyle(fontSize: 23),),
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed:() {Get.back();}, icon:const Icon(Icons.arrow_back_ios,color: ColorConstant.iconColor,),),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SizedBox(
            width: Get.width,
            child: ListView(
              padding:const EdgeInsets.all(15),
              children: [
                 const Text("Shipping Address",style: TextStyle(fontWeight: FontWeight.w500),),
                 Material(
                   elevation:5,
                   shadowColor: ColorConstant.primeryColor.withOpacity(0.2),
                   borderRadius: BorderRadius.circular(10),
                   child: Container(
                     width: Get.width,
                     height: 140,
                     padding:const EdgeInsets.all(15),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10)
                     ),
                     child: ListTile(
                       title: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         const Text("full name"),
                           Container(
                               width: 30,
                               height: 30,
                               decoration:const BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: ColorConstant.iconColor
                               ),
                               child:const Center(child: Icon(Icons.edit,color: ColorConstant.backgroundColor,size:20,))
                           ),
                         ],
                       ),
                       subtitle:const Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("23wes,sub Streat"),
                           Text("phone,"),
                           Text("City name,province COuntry"),
                   
                         ],
                       ),
                   
                     ),
                   
                   ),
                 ),
                const SizedBox(height: 15,),
                const Text("Payment Method",style: TextStyle(fontWeight: FontWeight.w500),),
                Material(
                  elevation: 4,
                  shadowColor: ColorConstant.primeryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                    width: Get.width,
                    height: 100,
                    padding:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:ListTile(
                      leading:Icon(Icons.payment,color: ColorConstant.primeryColor.withOpacity(0.5),size: 35,),
                      title:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("CBE"),
                          Container(
                              width: 30,
                              height: 30,
                              decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorConstant.iconColor
                              ),
                              child:const Center(child: Icon(Icons.edit,color: ColorConstant.backgroundColor,size:20,))
                          ),
                        ],
                      ),
                      subtitle:const Text("*********54",style: TextStyle(color: ColorConstant.iconColor),),
                    )
                  ),
                )
              ],
            ),

          )),
          Container(
            width: Get.width,
            padding:const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total",style: TextStyle(fontSize: 13,color: ColorConstant.iconColor),),
                    Text("\$234.00",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(
                    width: 200,
                    child: ElevatedButton(onPressed:(){}, child:const Text("Place Order",style: TextStyle(color: ColorConstant.backgroundColor),))),
              ],
            ),
          )
        ],
      )
    );
  }
}
