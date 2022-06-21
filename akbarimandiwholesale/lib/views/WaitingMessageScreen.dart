import 'package:flutter/material.dart';

class WaitingMessageScreen extends StatelessWidget {
  const WaitingMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
