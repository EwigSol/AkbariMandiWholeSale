import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:akbarimandiwholesale/Controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaitingMessageScreen extends StatelessWidget {
  WaitingMessageScreen({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('${userController.userGetter!.name!} خوش آمدید')),
        actions: [
          IconButton(
            onPressed: () async {
              await authController.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '- آپ کا اکاؤنٹ بن چکا ہے',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      // fontFamily: 'Noto Nastaliq Urdu',
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '-ایپ کے مکمل لاؤنچ تک انتظار کیجیے',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      // fontFamily: 'Noto Nastaliq Urdu',
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  '-اکبری منڈی جلد ہی آپکے ہاتھوں میں ہوگی',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      // fontFamily: 'Noto Nastaliq Urdu',
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
