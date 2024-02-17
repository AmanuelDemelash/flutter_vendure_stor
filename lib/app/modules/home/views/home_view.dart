
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';
import 'package:flutter_vendure_stor/app/modules/account/views/account_view.dart';
import 'package:flutter_vendure_stor/app/modules/cart/views/cart_view.dart';
import 'package:flutter_vendure_stor/app/modules/favorite/views/favorite_view.dart';
import 'package:flutter_vendure_stor/app/modules/home/views/home_dashbord_view.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:Obx(() =>CurvedNavigationBar(
          height:57,
          key: _bottomNavigationKey,
          index: controller.intialPage.value,
          backgroundColor: ColorConstant.backgroundColor,
          buttonBackgroundColor: ColorConstant.primeryColor,
          color: ColorConstant.primeryColor,
          items:const[
            Icon(Icons.home, size:25,color: ColorConstant.backgroundColor,),
            Icon(Icons.favorite, size: 25,color: ColorConstant.backgroundColor,),
            Badge(
                alignment: Alignment.topRight,
                backgroundColor: Colors.deepOrange,
                smallSize: 30,
               // offset: Offset(5, -3),
                label: Text("3"),
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,color: ColorConstant.backgroundColor,
                )),
            Icon(Icons.person, size: 25,color: ColorConstant.backgroundColor,)
          ],
          onTap: (index) {
           controller.intialPage.value=index;
           _pageController.jumpToPage(index);
          },
        ),),
            body:
            PageView(
            controller:_pageController,
             physics:const NeverScrollableScrollPhysics(),
             children:[
               HomeDashbordView(),
               FavoriteView(),
               CartView(),
               AccountView()
          ],

      )


    );
  }
}