// ignore_for_file: file_names, avoid_print

import 'package:akbarimandiwholesale/Models/BusinessInfoModel.dart';
import 'package:akbarimandiwholesale/Models/UserModel.dart';
import 'package:akbarimandiwholesale/utils/GlobalVariables.dart';
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
        "phone": userModel.phone,
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

  Future<void> addPhoneNumber(phone) async {
    await firestore
        .collection("users")
        .doc(userID.value)
        .collection('userDetials')
        .doc('userDetials')
        .update({"phone": phone});
  }

  Future<bool> addBusinessInfo(BusinessModel businessModel) async {
    try {
      await firestore.collection("users").doc(businessModel.id).set({
        "id": businessModel.id,
        "name": businessModel.name,
        "businessName": businessModel.businessName,
        "businessPhone": businessModel.businessPhone,
        "reffererName": businessModel.reffererName,
        "reffererPhone": businessModel.businessPhone,
        "frontImageUrl": businessModel.frontImageUrl,
        "insideImageUrl": businessModel.insideImageUrl,
        "insideImageUrl": businessModel.insideImageUrlTwo,
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Stream<List<BusinessModel>> businessStreamm(String uid) {
    return firestore
        .collection('users')
        .doc(uid)
        .collection('businessInfo')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<BusinessModel> retVal = [];
      querySnapshot.docs.forEach((element) {
        retVal.add(BusinessModel.fromFirestore(element));
      });
      return retVal;
    });
  }
}
