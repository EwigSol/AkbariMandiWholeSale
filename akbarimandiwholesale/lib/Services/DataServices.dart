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
        "description": userModel.description,
        'imageUrl': userModel.imageUrl,
        'direct': userModel.direct,
        'tag': userModel.tag,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
