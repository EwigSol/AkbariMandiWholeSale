import 'dart:io';

import 'package:akbarimandiwholesale/Controllers/Auth/AuthController.dart';
import 'package:akbarimandiwholesale/Controllers/UserController.dart';
import 'package:akbarimandiwholesale/Services/DataServices.dart';
import 'package:akbarimandiwholesale/Services/Storage.dart';
import 'package:akbarimandiwholesale/views/TextField.dart';
import 'package:akbarimandiwholesale/views/WaitingMessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BusinessDetailForm extends StatelessWidget {
  BusinessDetailForm({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController telePhoneController = TextEditingController();
  final TextEditingController refrerNameController = TextEditingController();
  final TextEditingController refrerPhoneController = TextEditingController();
  final userController = Get.put(UserController());
  // final userController = Get.find<UserController>();
  final authController = Get.put(AuthController());
  final obsecure = false;

  late File image;
  final imageIsNull = true.obs;

  final isUploading = false.obs;
  chooseImage() async {
    final imgPicker = ImagePicker();
    try {
      PickedFile? pickedFile = await imgPicker.getImage(
          source: ImageSource.camera, imageQuality: 20);
      image = File(pickedFile!.path);
      imageIsNull.value = false;
    } catch (e) {
      imageIsNull.value = true;
      Get.snackbar('Error', 'Select an Image to Upload');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _userContoller = Get.find<UserController>();
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('دوکان کی تفصیل فراہم کریں ')),
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            'دوکان کے فرنٹ کی تصویر اپلوڈ کریں',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 0.0),
                                  child: Container(
                                    height: 100.0,
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(60)),
                                    padding: EdgeInsets.all(2),
                                    child: Obx(
                                      () => userController.userGetter != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(60),
                                              child: isUploading.value
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    )
                                                  : Image.network(
                                                      '${Get.find<UserController>().userGetter!.frontImageUrl}',
                                                      fit: BoxFit.cover,
                                                      loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                        if (loadingProgress ==
                                                            null) {
                                                          return child;
                                                        }
                                                        return Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            value: loadingProgress
                                                                        .expectedTotalBytes !=
                                                                    null
                                                                ? loadingProgress
                                                                        .cumulativeBytesLoaded /
                                                                    loadingProgress
                                                                        .expectedTotalBytes!
                                                                : null,
                                                          ),
                                                        );
                                                      },
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return SvgPicture.asset(
                                                          'assets/images/shopicon.svg',
                                                          width: 25,
                                                        );
                                                      },
                                                    ),
                                            )
                                          : SvgPicture.asset(
                                              'assets/images/shpoicon.svg',
                                              width: 25,
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.green,
                                      ),
                                      color: Colors.green,
                                    ),
                                    height: 35,
                                    width: 35,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () async {
                                          await chooseImage();
                                          if (imageIsNull.value == false) {
                                            isUploading.value = true;
                                            String url = await Storage()
                                                .imageUploadToStorage(image);
                                            await Database()
                                                .updateFrontImagePic(url);
                                            isUploading.value = false;
                                          }
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'دوکان کے اندر  کی دو  تصویرں اپلوڈ کریں ',
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 0.0),
                                          child: Container(
                                            height: 100.0,
                                            width: 100.0,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(60)),
                                            padding: EdgeInsets.all(2),
                                            child: Obx(
                                              () => userController.userGetter !=
                                                      null
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              60),
                                                      child: isUploading.value
                                                          ? const Center(
                                                              child:
                                                                  CircularProgressIndicator(),
                                                            )
                                                          : Image.network(
                                                              '${Get.find<UserController>().userGetter!.insideImageUrl}',
                                                              fit: BoxFit.cover,
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                }
                                                                return Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    value: loadingProgress.expectedTotalBytes !=
                                                                            null
                                                                        ? loadingProgress.cumulativeBytesLoaded /
                                                                            loadingProgress.expectedTotalBytes!
                                                                        : null,
                                                                  ),
                                                                );
                                                              },
                                                              errorBuilder: (BuildContext
                                                                      context,
                                                                  Object
                                                                      exception,
                                                                  StackTrace?
                                                                      stackTrace) {
                                                                return SvgPicture
                                                                    .asset(
                                                                  'assets/images/shopicon.svg',
                                                                  width: 25,
                                                                );
                                                              },
                                                            ),
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/images/shpoicon.svg',
                                                      width: 25,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 3,
                                                color: Colors.green,
                                              ),
                                              color: Colors.green,
                                            ),
                                            height: 35,
                                            width: 35,
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () async {
                                                  await chooseImage();
                                                  if (imageIsNull.value ==
                                                      false) {
                                                    isUploading.value = true;
                                                    String url = await Storage()
                                                        .imageUploadToStorage(
                                                            image);
                                                    await Database()
                                                        .updateInsideImagePic(
                                                            url);
                                                    isUploading.value = false;
                                                  }
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0, bottom: 0.0),
                                              child: Container(
                                                height: 100.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                                padding: EdgeInsets.all(2),
                                                child: Obx(
                                                  () => userController
                                                              .userGetter !=
                                                          null
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(60),
                                                          child: isUploading
                                                                  .value
                                                              ? const Center(
                                                                  child:
                                                                      CircularProgressIndicator(),
                                                                )
                                                              : Image.network(
                                                                  '${Get.find<UserController>().userGetter!.insideImageUrlTwo}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  loadingBuilder: (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                    if (loadingProgress ==
                                                                        null) {
                                                                      return child;
                                                                    }
                                                                    return Center(
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        value: loadingProgress.expectedTotalBytes !=
                                                                                null
                                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                                                loadingProgress.expectedTotalBytes!
                                                                            : null,
                                                                      ),
                                                                    );
                                                                  },
                                                                  errorBuilder: (BuildContext
                                                                          context,
                                                                      Object
                                                                          exception,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                    return SvgPicture
                                                                        .asset(
                                                                      'assets/images/shopicon.svg',
                                                                      width: 25,
                                                                    );
                                                                  },
                                                                ),
                                                        )
                                                      : SvgPicture.asset(
                                                          'assets/images/shpoicon.svg',
                                                          width: 25,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    width: 3,
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.green,
                                                ),
                                                height: 35,
                                                width: 35,
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await chooseImage();
                                                      if (imageIsNull.value ==
                                                          false) {
                                                        isUploading.value =
                                                            true;
                                                        String url = await Storage()
                                                            .imageUploadToStorage(
                                                                image);
                                                        await Database()
                                                            .updateInsideImageTwoPic(
                                                                url);
                                                        isUploading.value =
                                                            false;
                                                      }
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
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
                              controller: businessNameController,
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
                          await Database().updateBusinessInformation(
                            businessNameController.text,
                            fullNameController.text,
                            telePhoneController.text,
                            refrerNameController.text,
                            refrerPhoneController.text,
                          );
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
                ],
              ),
            ),
          ),
        ));
  }
}
