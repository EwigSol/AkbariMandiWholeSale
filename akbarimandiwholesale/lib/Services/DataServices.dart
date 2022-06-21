// ignore_for_file: file_names, avoid_print

import 'package:akbarimandiwholesale/Models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //! Regarding Users

  Future<bool> createUser(UserModel userModel) async {
    try {
      await firestore
          .collection("users")
          .doc(userModel.id)
          .collection('userDetials')
          .doc('userDetials')
          .set({
        "id": userModel.id,
        "name": userModel.name,
        "email": userModel.email,
        "passKey": userModel.pass,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Stream<List<UserModel>> userStreamm(String uid) {
    return firestore
        .collection('users')
        .doc(uid)
        .collection('userDetials')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<UserModel> retVal = [];
      querySnapshot.docs.forEach((element) {
        retVal.add(UserModel.fromFirestore(element));
      });
      return retVal;
    });
  }
}
