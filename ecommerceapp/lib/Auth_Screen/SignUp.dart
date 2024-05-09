import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                Column(
                  children: [
                    customTextField(title: name, hint: namehint),
                    customTextField(title: email, hint: emailHint),
                    customTextField(title: password, hint: PasswordHint),
                    customTextField(title: retypepass, hint: PasswordHint),
                    10.heightBox,
                    Row(
                      children: [
                        Checkbox(
                            checkColor: whiteColor,
                            fillColor: MaterialStatePropertyAll(redColor),
                            value: Ischecked, onChanged: (newValue){
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
                                    style: TextStyle(color: fontGrey , fontFamily: bold)
                                ),
                                TextSpan(
                                  text: term,
                                  style: TextStyle(color: redColor , fontFamily: bold),
                                ),
                                TextSpan(
                                  text: privacy,
                                  style: TextStyle(color: redColor , fontFamily: bold),
                                ),
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                    ourButtons(
                        color: redColor,
                        title: sign,
                        textColor: whiteColor,
                        onPress: () {})
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    20.heightBox,
                    GestureDetector(
                      onTap: Get.back,
                      child: RichText(text: const TextSpan(
                          children: [TextSpan(
                        text: "Already Account ",
                            style: TextStyle(color: fontGrey,fontFamily: bold)

                      ),TextSpan(
                            text: already,
                              style: TextStyle(color: redColor,fontFamily: bold)
                          ),]

                      )

                      ),
                    )]
                )
                    .box
                    .padding(const EdgeInsets.all(16))
                    .width(context.screenWidth - 60).shadowSm
                    .white
                    .rounded
                    .make(),
              ],
            ),
          ),
        ));
  }
}
