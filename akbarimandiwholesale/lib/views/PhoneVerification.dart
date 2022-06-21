// ignore_for_file: file_names

import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:akbarimandiwholesale/views/Otp.dart';
import 'package:akbarimandiwholesale/views/OtpVerification.dart';
// import 'package:akbarimandiwholesale/views/OtpVerification.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerification extends StatelessWidget {
  final phone = TextEditingController();
  final AuthController loginController = Get.find<AuthController>();

  String _countryDialCode = '+92';

  // PhoneVerification();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('موبائل نمبر کی تصدیق کریں'),
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  child: CountryCodePicker(
                                    onChanged: (CountryCode coountryCode) {
                                      _countryDialCode = coountryCode.dialCode!;
                                    },
                                    initialSelection: _countryDialCode,
                                    favorite: [_countryDialCode],
                                    hideSearch: true,
                                    padding: EdgeInsets.zero,
                                    showDropDownButton: false,
                                    showFlagDialog: false,
                                    showFlagMain: true,
                                    textStyle:
                                        const TextStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: TextFormField(
                                    controller: phone,
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      labelText: 'موبائل نمبر',
                                      labelStyle: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40, bottom: 5),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  var _phone = _countryDialCode + phone.text;
                                  await loginController.verifyPhone(_phone);
                                  Get.to(OtpVerification());
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
                                        )),
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
