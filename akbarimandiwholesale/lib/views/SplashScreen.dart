import 'dart:async';
import 'dart:ffi';
import 'package:akbarimandiwholesale/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final height = Get.height;
  final width = Get.width;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.to(() => MyHomePage()));
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
            SizedBox(
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
            SizedBox(
              height: 10,
            ),
            const Text(
              'Akbari Mandi WholeSale',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  // fontFamily: 'Noto Nastaliq Urdu',s
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
