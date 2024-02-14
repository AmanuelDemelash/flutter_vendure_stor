
import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/constants/colorConstant.dart';
import 'package:flutter_vendure_stor/app/modules/account/views/account_view.dart';
import 'package:flutter_vendure_stor/app/modules/home/views/home_dashbord_view.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:Container(
       //   margin:const EdgeInsets.only(bottom: 10,right: 10,left: 10),
        //  decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       color: Colors.transparent
        //   ),
          child: Obx(() =>
              ClipRRect(
                borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                child: NavigationBar(
                    selectedIndex:controller.intialPage.value,
                    elevation: 10,
                    indicatorColor: ColorConstant.primeryColor,
                    onDestinationSelected: (value) async {
                      controller.intialPage.value=value;
                      controller.pageController.jumpToPage(value);
                      },
                    backgroundColor: ColorConstant.backgroundColor,
                    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                    destinations:const[
                      NavigationDestination(icon:Icon(Icons.home), label: "home"),
                      NavigationDestination(icon:Icon(Icons.favorite), label: "favorite"),
                      Badge(alignment: Alignment.centerRight,
                          backgroundColor: ColorConstant.primeryColor,
                          smallSize: 30,
                          offset: Offset(-25,-12),
                          label: Text("3"),
                          child: NavigationDestination(icon:Icon(Icons.card_travel_rounded), label: "cart")),
                      NavigationDestination(icon:Icon(Icons.person), label: "account"),
                    ]),
              ),)
      ),
      body:
         PageView(
          controller:controller.pageController,
          physics:const NeverScrollableScrollPhysics(),
          children: [
            const HomeDashbordView(),
            Container(),
            Container(),
            const AccountView()
          ],

      )


    );
  }
}