import 'package:ecommerceapp/CommonWidgets/CommonWidgets.dart';
import 'package:ecommerceapp/Home/Home.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Auth_Screen/LoginScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      // Get.to(() => const loginScreen());

      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => loginScreen());
        } else {
          Get.to(() => Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              )),
          20.heightBox,
          appicon(),
          10.heightBox,
          appname.text.fontFamily(bold).size(22).white.make(),
          20.heightBox,
          appversion.text.white.make(),
          Spacer(),
          credits.text.fontFamily(semibold).white.make(),
          35.heightBox
        ],
      ),
    );
  }
}
