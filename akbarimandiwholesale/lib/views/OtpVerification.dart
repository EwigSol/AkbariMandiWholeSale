// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Otp.dart';

class OtpVerification extends StatelessWidget {
  final phone = TextEditingController();
  final AuthController loginController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('او ٹی پی نمبر کی تصدیق کریں'),
      ),
      body: loginController.isLoading(false)
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Column(
                  children: [
                    Form(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            child: TextFormField(
                              controller: phone,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                labelText: 'او ٹی پی نمبر',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  loginController.verifyPhone(phone.text);
                                  Get.to(OtpScreen());
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15.0,
                                      horizontal: 15.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Expanded(
                                          child: Text(
                                            "تصدیق کریں",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}