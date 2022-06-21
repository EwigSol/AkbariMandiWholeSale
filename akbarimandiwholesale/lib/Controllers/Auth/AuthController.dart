// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, unused_catch_clause, unused_local_variable

import 'package:akbarimandiwholesale/Controllers/UserController.dart';
import 'package:akbarimandiwholesale/Models/UserModel.dart';
import 'package:akbarimandiwholesale/Services/DataServices.dart';
import 'package:akbarimandiwholesale/utils/GlobalVariables.dart';
import 'package:akbarimandiwholesale/views/Home.dart';
import 'package:akbarimandiwholesale/views/OtpVerification.dart';
import 'package:akbarimandiwholesale/views/PhoneVerification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var verId = '';
  var authStatus = ''.obs;

  var auth = FirebaseAuth.instance;

  verifyPhone(String phone) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
        timeout: const Duration(seconds: 50),
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          Get.snackbar("Code has Been Sent", "Please Enter the OTP");
          await auth.signInWithCredential(authCredential);
        },
        verificationFailed: (authException) {
          if (authException.code == 'invalid-phone-number') {
            Get.snackbar("sms code info", "otp code hasn't been sent!!",
                snackPosition: SnackPosition.BOTTOM);
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          isLoading.value = false;
          verId = verificationId;
          authStatus.value = "login successfully";
        },
        codeAutoRetrievalTimeout: (String id) {
          verId = id;
        });
  }

  otpVerify(String otp) async {
    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.signInWithCredential(
          PhoneAuthProvider.credential(verificationId: verId, smsCode: otp));
      if (userCredential.user != null) {
        isLoading.value = false;
        Get.to(Home());
      }
    } on Exception catch (e) {
      Get.snackbar("otp info", "otp code is not correct !!",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> createUserViaEmail(
    String email,
    String password,
  ) async {
    try {
      UserCredential _auth = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel _userModel = UserModel(
        id: _auth.user!.uid,
        email: email,
        pass: password,
      );
      await Database().createUser(_userModel);
      Get.to(() => PhoneVerification());
      Get.snackbar('Welcome', 'Account Created Successfuly',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error Creating Account', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logIn(String email, String password) async {
    try {
      UserCredential _authResult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      isSigned.value = true;
      userID.value = _authResult.user!.uid;
      Get.put(UserController()).onInit();

      Get.offAll(
        () => PhoneVerification(),
      );
      Get.snackbar(
        "SignedIn",
        "Signedin Successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error in Signing In", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
