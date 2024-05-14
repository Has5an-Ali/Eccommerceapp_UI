import 'dart:io';

import 'package:ecommerceapp/CommonWidgets/Buttons.dart';
import 'package:ecommerceapp/CommonWidgets/CustomTextFields.dart';
import 'package:ecommerceapp/CommonWidgets/common_bg.dart';
import 'package:ecommerceapp/HomeController/Account_Controller.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(profileController());
    Get.find<profileController>();
    return commonBackground(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileimagepath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 110,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileimagepath.value),
                      width: 110,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButtons(
                  title: 'ChangeImage',
                  color: redColor,
                  onPress: () {
                    controller.changeimagepath(context);
                  },
                  textColor: whiteColor),
              20.heightBox,
              customTextField(hint: namehint, Ispass: false, title: name),
              10.heightBox,
              customTextField(
                  hint: PasswordHint, Ispass: true, title: password),
              30.heightBox,
              SizedBox(
                width: context.screenWidth - 70,
                child: ourButtons(
                    title: 'Save',
                    color: redColor,
                    onPress: () {},
                    textColor: whiteColor),
              ),
            ],
          )
              .box
              .white
              .padding(EdgeInsets.all(12))
              .rounded
              .shadowSm
              .margin(EdgeInsets.all(15))
              .make(),
        ),
      ),
    ));
  }
}
