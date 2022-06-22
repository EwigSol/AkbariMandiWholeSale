import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:akbarimandiwholesale/Controllers/UserController.dart';
import 'package:akbarimandiwholesale/utils/GlobalVariables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}

class AuthCheckBinding implements Bindings {
  @override
  void dependencies() {
    if (Get.find<AuthController>().userGetter != null) {
      print('auth checking...');
      isSigned.value = true;
      userID.value = Get.find<AuthController>().userGetter!.uid;
      debugPrint('User Found:::: ${userID.value}');
      Get.put(UserController());
    } else {
      isSigned.value = false;
      debugPrint('User not Found*******************');
    }
  }
}
