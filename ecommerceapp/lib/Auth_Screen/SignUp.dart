import 'package:ecommerceapp/Home/Home.dart';
import 'package:ecommerceapp/HomeController/Auth_Controller.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../CommonWidgets/Buttons.dart';
import '../CommonWidgets/CommonWidgets.dart';
import '../CommonWidgets/CustomTextFields.dart';
import '../CommonWidgets/common_bg.dart';

class signScreen extends StatefulWidget {
  const signScreen({super.key});

  @override
  State<signScreen> createState() => _signScreenState();
}

class _signScreenState extends State<signScreen> {
  var Controller = Get.put(authController());

  var NameController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();
  var RetypePasswordController = TextEditingController();

  bool Ischecked = false;
  @override
  Widget build(BuildContext context) {
    return commonBackground(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appicon(),
            10.heightBox,
            "Join The $appname".text.white.fontFamily(semibold).make(),
            10.heightBox,
            Obx(
              () => Column(children: [
                customTextField(
                    title: name,
                    hint: namehint,
                    controller: NameController,
                    Ispass: false),
                customTextField(
                    title: email,
                    hint: emailHint,
                    controller: EmailController,
                    Ispass: false),
                customTextField(
                    title: password,
                    hint: PasswordHint,
                    controller: PasswordController,
                    Ispass: true),
                customTextField(
                    title: retypepass,
                    hint: PasswordHint,
                    controller: RetypePasswordController,
                    Ispass: true),
                10.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: whiteColor,
                        fillColor: const MaterialStatePropertyAll(redColor),
                        value: Ischecked,
                        onChanged: (newValue) {
                          setState(() {
                            Ischecked = newValue!;
                          });
                        }),
                    5.widthBox,
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                    color: fontGrey, fontFamily: bold)),
                            TextSpan(
                              text: term,
                              style:
                                  TextStyle(color: redColor, fontFamily: bold),
                            ),
                            TextSpan(
                              text: privacy,
                              style:
                                  TextStyle(color: redColor, fontFamily: bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Controller.isloading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : ourButtons(
                        color: Ischecked == true ? redColor : lightGrey,
                        title: sign,
                        textColor: whiteColor,
                        onPress: () async {
                          Controller.isloading(true);
                          // ignore: unnecessary_null_comparison
                          if (Ischecked != false && EmailController == null) {
                            try {
                              await Controller.signupmethod(
                                      context: context,
                                      email: EmailController.text,
                                      password: PasswordController.text)
                                  .then((value) {
                                return Controller.storeuserdata(
                                    email: EmailController.text,
                                    password: PasswordController.text,
                                    name: NameController.text);
                              }).then((value) {
                                VxToast.show(context, msg: userlogin);
                                Get.offAll(() => const Home());
                              });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              Controller.isloading(false);
                            }
                          }
                        }).box.width(context.screenWidth - 50).make(),
                20.heightBox,
                GestureDetector(
                  onTap: Get.back,
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                        text: "Already Account ",
                        style: TextStyle(color: fontGrey, fontFamily: bold)),
                    TextSpan(
                        text: already,
                        style: TextStyle(color: redColor, fontFamily: bold)),
                  ])),
                )
              ])
                  .box
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 60)
                  .shadowSm
                  .white
                  .rounded
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }
}
