import 'package:ecommerceapp/conts/consts.dart';
import 'package:get/get.dart';

class authController extends GetxController {
// Registration Method

  Future<UserCredential?> signupmethod({
    context,
    email,
    password,
  }) async {
    UserCredential? userCredential;

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

// User Sign

  Future<UserCredential?> signinmethod({context, email, password}) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

//User Collection

  storeuserdata({name, email, password}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'Name': name,
      'Email': email,
      'Password': password,
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
