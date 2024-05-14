import 'package:ecommerceapp/conts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class profileController extends GetxController {
  var profileimagepath = ''.obs;

  changeimagepath(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) {
        return;
      }
      profileimagepath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
