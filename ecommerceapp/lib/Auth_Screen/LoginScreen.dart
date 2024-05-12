import 'package:ecommerceapp/CommonWidgets/socialList.dart';
import 'package:ecommerceapp/HomeController/Auth_Controller.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:ecommerceapp/conts/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../CommonWidgets/Buttons.dart';
import '../CommonWidgets/CommonWidgets.dart';
import '../CommonWidgets/CustomTextFields.dart';
import '../CommonWidgets/common_bg.dart';
import '../Home/Home.dart';
import 'SignUp.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(authController());

    return commonBackground(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appicon(),
            10.heightBox,
            "Login into $appname".text.white.fontFamily(semibold).make(),
            10.heightBox,
            Column(
              children: [
                customTextField(
                    title: email,
                    hint: emailHint,
                    Ispass: false,
                    controller: controller.emailController),
                customTextField(
                    title: password,
                    hint: PasswordHint,
                    Ispass: true,
                    controller: controller.passwordController),
                5.heightBox,
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgotpass.text.make())),
                ourButtons(
                    color: redColor,
                    title: log,
                    textColor: whiteColor,
                    onPress: () async {
                      await controller
                          .signinmethod(context: context)
                          .then((value) {
                        if (value != null) {
                          VxToast.show(context, msg: userlogin);
                          Get.offAll(Home());
                        }
                      });
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                create.text.make(),
                10.heightBox,
                ourButtons(
                    color: lightGolden,
                    title: sign,
                    textColor: redColor,
                    onPress: () {
                      Get.to(() => const signScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                login.text.make(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => CircleAvatar(
                      radius: 25,
                      backgroundColor: lightGrey,
                      child: Image.asset(
                          width: 35,
                          socialicon[index]), // Accessing elements using index
                    ),
                  ),
                )
              ],
            )
                .box
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 65)
                .shadowSm
                .white
                .rounded
                .make(),
          ],
        ),
      ),
    ));
  }
}
