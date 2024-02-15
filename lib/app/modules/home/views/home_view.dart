
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
            Icon(Icons.shopping_cart, size: 25,color: ColorConstant.backgroundColor,),
            Icon(Icons.person, size: 25,color: ColorConstant.backgroundColor,)
          ],
          onTap: (index) {
           controller.intialPage.value=index;
           controller.pageController.jumpToPage(index);
          },
        ),),
        // SnakeNavigationBar.color(
        //   behaviour:SnakeBarBehaviour.floating,
        //   snakeShape:SnakeShape.rectangle,
        //   //shape:ShapeBorder,
        //   padding:const EdgeInsets.all(15) ,
        //   ///configuration for SnakeNavigationBar.color
        //   snakeViewColor:ColorConstant.primeryColor,
        //   selectedItemColor:ColorConstant.backgroundColor,
        //   ///configuration for SnakeNavigationBar.gradient
        //   //snakeViewGradient: selectedGradient,
        //   //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //   //unselectedItemGradient: unselectedGradient,
        //   showUnselectedLabels:true,
        //   showSelectedLabels: true,
        //   currentIndex:controller.intialPage.value,
        //   onTap:(value) {
        //     controller.intialPage.value=value;
        //     controller.pageController.jumpToPage(value);
        //
        //   },
        //     items:const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        //     ],
        //     ),),

            // Container(
            //    margin:const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            //    decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(30),
            //         color: Colors.transparent
            //     ),
            //     child: Obx(() =>
            //         ClipRRect(
            //           borderRadius:BorderRadius.circular(40),
            //           child: NavigationBar(
            //               selectedIndex:controller.intialPage.value,
            //               elevation: 10,
            //               indicatorColor: ColorConstant.primeryColor,
            //               onDestinationSelected: (value) async {
            //                 controller.intialPage.value=value;
            //                 controller.pageController.jumpToPage(value);
            //                 },
            //               backgroundColor: ColorConstant.backgroundColor,
            //               labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            //               destinations:const[
            //                 NavigationDestination(icon:Icon(Icons.home), label: "home"),
            //                 NavigationDestination(icon:Icon(Icons.favorite), label: "favorite"),
            //                 Badge(alignment: Alignment.centerRight,
            //                     backgroundColor: ColorConstant.primeryColor,
            //                     smallSize: 30,
            //                     offset: Offset(-25,-12),
            //                     label: Text("3"),
            //                     child: NavigationDestination(icon:Icon(Icons.card_travel_rounded), label: "cart")),
            //                 NavigationDestination(icon:Icon(Icons.person), label: "account"),
            //               ]),
            //         ),)
            // ),
            body:
            PageView(
            controller:controller.pageController,
             physics:const NeverScrollableScrollPhysics(),
             children: [
              const HomeDashbordView(),
              const FavoriteView(),
              const CartView(),
               const AccountView()
          ],

      )


    );
  }
}