import 'package:flutter/material.dart';
import 'package:flutter_vendure_stor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../constants/colorConstant.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                const SizedBox(height:100),
                const Text(
                  "Bazaar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstant.backgroundColor,
                      fontSize:36,
                      letterSpacing:7),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.all(30),
                    child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Sign In",style:TextStyle(color: ColorConstant.backgroundColor,fontWeight: FontWeight.w400,fontSize: 20),),
                            const SizedBox(
                              height:30
                            ),
                            TextFormField(
                              cursorColor: ColorConstant.backgroundColor,
                              style:const TextStyle(color: ColorConstant.backgroundColor),
                              decoration:InputDecoration(
                                filled: false,
                                hintText: "email",
                                hintStyle: TextStyle(color: ColorConstant.backgroundColor.withOpacity(0.9)),
                                prefixIcon:const Icon(
                                  Icons.person,
                                  color: ColorConstant.backgroundColor,
                                ),
                                border:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                focusedBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                disabledBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                enabledBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                errorBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.red)),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Obx(() =>
                            TextFormField(
                              obscureText:controller.showPassword.value,
                               cursorColor: ColorConstant.backgroundColor,
                               style:const TextStyle(color: ColorConstant.backgroundColor),
                              decoration: InputDecoration(
                                filled: false,
                                hintText: "password",
                                hintStyle: TextStyle(color: ColorConstant.backgroundColor.withOpacity(0.9)),
                                prefixIcon:const Icon(
                                  Icons.lock,
                                  color: ColorConstant.backgroundColor,
                                ),
                                suffixIcon:controller.showPassword.value?
                                IconButton(onPressed:() => controller.showPassword.value=false, icon:const Icon(Icons.visibility_off,color: ColorConstant.backgroundColor,)):
                                IconButton(onPressed:() => controller.showPassword.value=true, icon:const Icon(Icons.visibility,color: ColorConstant.backgroundColor,)),
                                border:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                disabledBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                enabledBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: ColorConstant.backgroundColor)),
                                errorBorder:const UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.red)),
                              ),
                            ),),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConstant.backgroundColor,
                                  padding:const EdgeInsets.all(15),
                                  elevation: 0
                                ),
                                  onPressed: () {
                                    Get.toNamed(Routes.HOME);
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(color: ColorConstant.primeryColor),
                                  )),
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                  margin:const EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don`t have an account ",style: TextStyle(color: ColorConstant.backgroundColor.withOpacity(0.8)),),
                        InkWell(
                            onTap:() => Get.toNamed(Routes.SIGNUP),
                            child: const Text(
                              "SIGNUP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstant.backgroundColor),
                            )),
                      ],
                    )),
              ]),
            )

          ],
        )


            );
  }
}
