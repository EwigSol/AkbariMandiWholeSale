import 'package:akbarimandiwholesale/Binidngs.dart/Allbindings.dart';
import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:akbarimandiwholesale/Controllers/UserController.dart';
import 'package:akbarimandiwholesale/utils/constants.dart';
import 'package:akbarimandiwholesale/views/BusinessDetailFomr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  // Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AuthCheckBinding(),
      title: CONST_APP_NAME,
      theme: ThemeData(
          primaryColor: Colors.green,
          primarySwatch: Colors.green,
          fontFamily: 'Noori'),
      home: const SplashScreen(),
    );
  }
}
