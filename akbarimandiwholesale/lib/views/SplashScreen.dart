import 'dart:async';
import 'dart:ffi';
import 'package:akbarimandiwholesale/views/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double height = Get.height;
  double width = Get.width;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.to(() => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'اکبری مندی ہول سیل',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 35,
                  fontFamily: 'Noto Nastaliq Urdu',
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Akbari Mandi WholeSale',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'popins',
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
