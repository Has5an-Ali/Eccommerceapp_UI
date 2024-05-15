import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerceapp/conts/consts.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;
  var profileImageLink = ''.obs;

  var nameController = TextEditingController();
  var passController = TextEditingController();

  var isLoading = false.obs;

  Future<void> changeImagePath(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) {
        return;
      }
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  Future<void> imageUpload() async {
    var filename = File(profileImagePath.value).path.split('/').last;
    var destination = 'images/${currentUser!.uid}/$filename';

    Reference ref = FirebaseStorage.instance.ref().child(destination);
    TaskSnapshot uploadTask = await ref.putFile(File(profileImagePath.value));
    String downloadUrl = await uploadTask.ref.getDownloadURL();
    profileImageLink.value = downloadUrl;
  }

  Future<void> updateProfile({name, password, imgUrl}) async {
    try {
      var store = FirebaseFirestore.instance
          .collection(userCollection)
          .doc(currentUser!.uid);
      await store.set({
        'Name': name,
        'Password': password,
        'ImageURL': imgUrl,
      }, SetOptions(merge: true));
    } catch (e) {
      print("Error updating profile: $e");
    }
  }
}
