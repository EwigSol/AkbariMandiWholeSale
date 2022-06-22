// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors

import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:akbarimandiwholesale/Services/DataServices.dart';
import 'package:akbarimandiwholesale/views/BusinessDetailFomr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final authController = Get.put(AuthController());
  double height = Get.height;
  var location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('دکان کی لوکیشن سلیکٹ کریں')),
        actions: [
          IconButton(
            onPressed: () async {
              await authController.signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'کیا آپ دکان پر موجود ہیں ؟',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 52,
                    // fontFamily: 'Noto Nastaliq Urdu',
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await locationService();
                      await Get.to(() => BusinessDetailForm());
                    },
                    child: SizedBox(
                      height: 100,
                      width: 120,
                      child: Center(
                        child: Text(
                          "'ہاں\n !دکان پر موجود ہوں",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              // fontFamily: 'Noto Nastaliq Urdu',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'دوکان پر جائیں اور دوبارہ اپلائی کریں',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 25,
                                              // fontFamily: 'Noto Nastaliq Urdu',
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      Center(
                                        child: SizedBox(
                                          width: 100.0,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "!ٹھیک ہے",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white),
                                            ),
                                            // color: const Color(0xFF1BC0C5),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: SizedBox(
                      height: 100,
                      width: 120,
                      child: Center(
                        child: Text(
                          "'نہیں\n !دکان پر موجود نہیں ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              // fontFamily: 'Noto Nastaliq Urdu',
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  locationService() async {
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    var currentLocation = await location.getLocation();
    var latitude = currentLocation.latitude.toString();
    var longitude = currentLocation.longitude.toString();
    await Database().updateLocation(latitude, longitude);
    print(latitude);
    print(longitude);

    print(currentLocation.toString());
  }
}
