import 'dart:io';

import 'package:ecommerceapp/CommonWidgets/Buttons.dart';
import 'package:ecommerceapp/CommonWidgets/CustomTextFields.dart';
import 'package:ecommerceapp/CommonWidgets/common_bg.dart';
import 'package:ecommerceapp/HomeController/Account_Controller.dart';
import 'package:ecommerceapp/conts/consts.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final dynamic data;

  EditScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    // Textfiled data
    // Get.find<profileController>();

    return commonBackground(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImagePath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 110,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileImagePath.value),
                      width: 110,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButtons(
                  title: 'ChangeImage',
                  color: redColor,
                  onPress: () {
                    controller.changeImagePath(context);
                  },
                  textColor: whiteColor),
              20.heightBox,
              customTextField(
                  controller: controller.nameController,
                  hint: namehint,
                  Ispass: false,
                  title: name),
              10.heightBox,
              customTextField(
                  controller: controller.passController,
                  hint: PasswordHint,
                  Ispass: true,
                  title: password),
              30.heightBox,
              controller.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 70,
                      child: ourButtons(
                          title: 'Save',
                          color: redColor,
                          onPress: () async {
                            await controller.imageUpload();
                            await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.passController.text);
                            VxToast.show(context, msg: "ProfileUpdated!");
                          },
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
