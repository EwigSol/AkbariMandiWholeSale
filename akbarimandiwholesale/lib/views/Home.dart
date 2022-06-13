import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    fontSize: 15,
                    fontFamily: 'Noto Nastaliq Urdu',
                    fontWeight: FontWeight.normal),
              ),
              TextField(),
            ],
          ),
        ),
      ),
    );
  }
}
