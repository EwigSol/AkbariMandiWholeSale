import 'package:akbarimandiwholesale/views/TextField.dart';
import 'package:akbarimandiwholesale/views/WaitingMessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BusinessDetailForm extends StatelessWidget {
  BusinessDetailForm({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController telePhoneController = TextEditingController();
  final TextEditingController refrerNameController = TextEditingController();
  final TextEditingController refrerPhoneController = TextEditingController();

  final obsecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldWidget(
                        lable: 'آپ کا پورا نام',
                        controller: fullNameController,
                        leadingIcon: Icons.person,
                        obsecure: obsecure),
                    TextFieldWidget(
                        lable: 'آپ کی دوکان کا نام',
                        controller: shopNameController,
                        leadingIcon: Icons.store,
                        obsecure: obsecure),
                    TextFieldWidget(
                        lable: 'آپ کا موبائل نمبر',
                        controller: telePhoneController,
                        leadingIcon: Icons.phone,
                        obsecure: obsecure),
                    TextFieldWidget(
                        lable: 'ریفرر کا نام',
                        controller: refrerNameController,
                        leadingIcon: Icons.person_add,
                        obsecure: obsecure),
                    TextFieldWidget(
                        lable: 'ریفرر کا موبائل نمبر',
                        controller: refrerPhoneController,
                        leadingIcon: Icons.phone_android,
                        obsecure: obsecure),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () async {
                    Get.to(() => WaitingMessageScreen());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        '-ایپلیکیشن درج کریں',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // MaterialButton(
            //   color: Colors.green,
            //   onPressed: () {},
            //   child: const Center(
            //     child: Padding(
            //       padding: EdgeInsets.all(20.0),
            //       child: Text(
            //         ,
            //         style: TextStyle(
            //             color: Colors.white, fontSize: 32, letterSpacing: 2),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
