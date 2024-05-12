import 'package:ecommerceapp/conts/consts.dart';
import 'package:get/get.dart';

class authController extends GetxController {
  // Loading

  var isloading = false.obs;

  // Text Controller for login
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
// Registration Method

  Future<UserCredential?> signupmethod({
    context,
    email,
    password,
  }) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

// User Sign

  Future<UserCredential?> signinmethod({
    context,
  }) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

//User Collection

  storeuserdata({name, email, password}) async {
    DocumentReference store =
        await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'Name': name,
      'Email': email,
      'Password': password,
      'id': currentUser!.uid,
    });
  }

  //User Sigout Method

  usersignoutMethod({context}) async {
    try {
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
