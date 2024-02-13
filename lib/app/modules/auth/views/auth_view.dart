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
              color: ColorConstant.primeryColor.withOpacity(0.4),
            ),
            ListView(padding: const EdgeInsets.all(15), children: [
              const SizedBox(height: 60),
              const Text(
                "Bazaar",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.backgroundColor,
                    fontSize: 26,
                    letterSpacing: 10),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: Get.width,
                padding: const EdgeInsets.all(15),
                child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Sign In"),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "email",
                            prefixIcon: Icon(
                              Icons.person,
                              color: ColorConstant.primeryColor,
                            ),
                            border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.backgroundColor)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.primeryColor)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.primeryColor)),
                            errorBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.primeryColor)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: "password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorConstant.primeryColor,
                            ),
                            border: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.backgroundColor)),
                            disabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.primeryColor)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.primeryColor)),
                            errorBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: ColorConstant.primeryColor)),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.backgroundColor
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
              SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don`t have an account ",style: TextStyle(color: ColorConstant.backgroundColor),),
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            "SIGNUP",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstant.primeryColor),
                          )),
                    ],
                  )),
            ])

          ],
        )


            );
  }
}
