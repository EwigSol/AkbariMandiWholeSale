// ignore_for_file: file_names, avoid_print

import 'package:akbarimandiwholesale/Models/BusinessInfoModel.dart';
import 'package:akbarimandiwholesale/Models/UserModel.dart';
import 'package:akbarimandiwholesale/utils/GlobalVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        "businessName": userModel.businessName,
        "businessPhone": userModel.businessPhone,
        "reffererName": userModel.reffererName,
        "reffererPhone": userModel.businessPhone,
        "frontImageUrl": userModel.frontImageUrl,
        "insideImageUrl": userModel.insideImageUrl,
        "insideImageUrlTwo": userModel.insideImageUrlTwo,
        "longitude": userModel.longitude,
        "latitude": userModel.latitude,
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

  Future<void> updateFrontImagePic(imageUrl) async {
    await firestore
        .collection("users")
        .doc(userID.value)
        .collection('userDetials')
        .doc('userDetials')
        .update({"frontImageUrl": imageUrl});
  }

  Future<void> updateInsideImagePic(imageUrl) async {
    await firestore
        .collection("users")
        .doc(userID.value)
        .collection('userDetials')
        .doc('userDetials')
        .update({"insideImageUrl": imageUrl});
  }

  Future<void> updateInsideImageTwoPic(imageUrl) async {
    await firestore
        .collection("users")
        .doc(userID.value)
        .collection('userDetials')
        .doc('userDetials')
        .update({"insideImageUrlTwo": imageUrl});
  }

  Future<void> updateBusinessInformation(
      bsuinessName, fullName, businessPhone, refererName, refererPhone) async {
    await firestore
        .collection("users")
        .doc(userID.value)
        .collection('userDetials')
        .doc('userDetials')
        .update({
      "name": fullName,
      "businessName": bsuinessName,
      "businessPhone": businessPhone,
      "reffererName": refererName,
      "reffererPhone": refererName,
    });
  }

  Future<void> updateLocation(latitude, longitude) async {
    await firestore
        .collection("users")
        .doc(userID.value)
        .collection('userDetials')
        .doc('userDetials')
        .update({"latitude": latitude, "longitude": longitude});
  }
}
