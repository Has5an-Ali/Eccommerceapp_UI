import 'package:ecommerceapp/conts/consts.dart';

class Firestoreservice {
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
