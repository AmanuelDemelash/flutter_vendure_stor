import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed:() => Get.back(), icon:const Icon(Icons.arrow_back_ios,color: ColorConstant.iconColor,)),
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
      body:Column(
        children: [
          Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width:70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:List.generate(
                          3, (index) =>
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                placeholder: (context, url) =>
                                const Icon(
                                  Icons.image,
                                  color: ColorConstant.iconColor,
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                fit: BoxFit.cover,
                                width:60,
                                height:60,
                              ),
                            )
                          ,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: Get.width,
                        margin:const EdgeInsets.all(10),
                        height: 230,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:
                            "https://images.unsplash.com/photo-1605348532760-6753d2c43329?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                            placeholder: (context, url) =>
                            const Icon(
                              Icons.image,
                              color: ColorConstant.iconColor,
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            fit: BoxFit.cover,
                            width: Get.width,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
      ]
          ),

    ),
          Container(
            width: Get.width,
            padding:const EdgeInsets.all(15),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorConstant.backgroundColor,
                        side:const BorderSide(color: ColorConstant.primeryColor)
                      ),
                        onPressed: () {}, child:const Text("Add To Cart")),
                  ),
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0
                      ),
                        onPressed: () {}, child:const Text("Buy Now",style: TextStyle(color: ColorConstant.backgroundColor),)),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
