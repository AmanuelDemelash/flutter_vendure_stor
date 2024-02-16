import 'package:cached_network_image/cached_network_image.dart';
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
        excludeHeaderSemantics:true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder:(context, index) =>
                  Dismissible(
                    key: Key(index.toString()),
                    onDismissed: (direction){},
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: Get.width,
                        height: 100,
                        child:
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                child: CachedNetworkImage(
                                  imageUrl:
                                  "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  placeholder: (context, url) => const Icon(
                                    Icons.image,
                                    color: ColorConstant.iconColor,
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  width:100,
                                  height: 100,
                                ),
                              ),
                              const Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title:Text("Pilot Bags"),
                                      subtitle: Text("description about the product"),
                                      subtitleTextStyle: TextStyle(fontSize:14,color: Colors.black45),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left:20),
                                    child: Text("\$345.00",style: TextStyle(color: ColorConstant.primeryColor,fontSize: 16,fontWeight: FontWeight.w700),),
                                  ),
                              ],)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 const  Icon(Icons.add),
                                  Container(
                                    width: 30,
                                      height: 30,
                                      decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                          border: const Border.fromBorderSide(BorderSide(width:1,color: ColorConstant.primeryColor))
                                      ),
                                      child: Center(child: Text("3"))),
                                  const Icon(Icons.minimize)
                                ],
                              )
                            ],
                          )
                        ),
                    ),

                  ),
            ),
          ),
          Container(
            width: Get.width,
            height: 200,
            padding:const EdgeInsets.all(15),
            decoration:const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(children: [
                  Expanded(
                    child: TextField(
                      style:const TextStyle(fontSize: 12),
                      cursorColor: ColorConstant.primeryColor,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConstant.primeryColor.withOpacity(0.2),
                        hintText: "promo code hear",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    padding:const EdgeInsets.all(12),
                      decoration:const BoxDecoration(
                        border: Border.fromBorderSide(BorderSide(width:1,color: ColorConstant.primeryColor))
                      ),
                      child:const Text("Apply"))
                ],),
               const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$0.0"),
                      Row(children: [Text("Delivery type"), SizedBox(width: 10,),
                        Text("Normal")],)
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                ListTile(
                  title:const Text("Total",style: TextStyle(fontSize: 11,color: ColorConstant.iconColor),),
                  subtitle:const Text("\$234.00",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  trailing: SizedBox(
                    width: 200,
                      child: ElevatedButton(onPressed:(){}, child:const Text("CheckOut",style: TextStyle(color: ColorConstant.backgroundColor),))),
                )

              ],
            ),

          )
        ],
      )
    );
  }
}
