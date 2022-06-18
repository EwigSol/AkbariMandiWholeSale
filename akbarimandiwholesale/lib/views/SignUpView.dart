import 'package:akbarimandiwholesale/views/LoginView.dart';
import 'package:akbarimandiwholesale/views/TextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'SocialIconWidget.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/app_logo.png',
                    height: 100,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'اکبری مندی ہول سیل',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 52.0,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        TextFieldWidget(
                          obsecure: false,
                          controller: emailController,
                          leadingIcon: Icons.mail,
                          lable: 'ای میل انٹر کریں',
                          trailing: isObsecure.value ? SizedBox() : SizedBox(),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => TextFieldWidget(
                            controller: passwordController,
                            leadingIcon: Icons.lock,
                            lable: 'پاس ورڈ انٹر کریں',
                            obsecure: isObsecure.value,
                            trailing: isObsecure.value
                                ? IconButton(
                                    onPressed: () {
                                      isObsecure.value = false;
                                    },
                                    icon: const Icon(
                                      Icons.password,
                                      color: Colors.black,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      isObsecure.value = true;
                                    },
                                    icon: const Icon(
                                      Icons.remove_red_eye,
                                      color: Colors.black,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: MaterialButton(
                              height: 60.0,
                              color: Colors.green,
                              onPressed: () async {
                                // isLoading.value = true;
                                // if (GetUtils.isEmail(emailController.text)) {
                                //   await authController.logIn(
                                //       emailController.text,
                                //       passwordController.text);
                                // } else {
                                //   Get.snackbar(
                                //       "Input Error", 'Enter Valid Data',
                                //       snackPosition: SnackPosition.BOTTOM,
                                //       backgroundColor: kRedColor);
                              },
                              // isLoading.value = false;
                              // },
                              child: const Text(
                                'نیا اکاؤنٹ بنائیں',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    letterSpacing: 2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Get.to(() => Login());
                              },
                              child: const Text(
                                "لاگ ان کریں.",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'اکاؤنٹ پہلے سے ہے ؟',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 24),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: const [
                            Expanded(
                                child: Divider(
                              thickness: 2,
                              indent: 20,
                              endIndent: 10,
                            )),
                            Text(
                              'یا پھر سوشل میڈیا سے اکاؤنٹ بنائیں ؟',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 2,
                                indent: 10,
                                endIndent: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialIconLogin(
                              image: 'assets/images/googleicon.svg',
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SocialIconLogin(
                              image: 'assets/images/facebookicon.svg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
