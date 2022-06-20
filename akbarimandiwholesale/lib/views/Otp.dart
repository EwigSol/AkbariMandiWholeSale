// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  final loginController = Get.put(AuthController());
  final otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginController.isLoading(false)
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
              children: [
                const Spacer(),
                TextField(
                  controller: otp,
                  decoration: const InputDecoration(
                    hintText: "Enter OTP",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // FlatButton(
                //   onPressed: () {
                //     loginController.otpVerify(otp.text);
                //   },
                //   child: Text("VERIFY"),
                //   color: Colors.blue,
                //   textColor: Colors.white,
                // ),
                const Spacer(),
              ],
            )),
    );
  }
}
