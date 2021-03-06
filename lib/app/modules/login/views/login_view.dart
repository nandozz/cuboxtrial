import 'package:cubox/app/data/MQTTManager.dart';
import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  // final TextEditingController controller.cuboxIDTextController = TextEditingController();
  // final TextEditingController controller.cuboxAccKeyTextController =
  //     TextEditingController();

  late MQTTManager manager;

  @override
  Widget build(BuildContext context) {
    // final statusBar = MediaQuery.of(context).padding.top;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF7BD2C3),
          ),
          elevation: 0,
          backgroundColor: Color(0xFF7BD2C3),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.COURIER);
              },
              icon: Icon(
                Icons.qr_code_scanner_rounded,
                color: Color(0xff136A5A),
                size: 35,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: Color(0xFF7BD2C3),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Image.asset('assets/images/cubox.png'),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'cubox ID',
                        style:
                            TextStyle(color: Color(0xff136A5A), fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff136A5A)),
                        enabled: true,
                        controller: controller.cuboxIDTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              left: 10, bottom: 0, top: 0, right: 0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Access Key',
                        style:
                            TextStyle(color: Color(0xff136A5A), fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () => TextField(
                          obscureText: controller.isHiddenPass.value,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff136A5A)),
                          enabled: true,
                          controller: controller.cuboxAccKeyTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 50, bottom: 0, top: 0, right: 0),
                            suffixIcon: IconButton(
                              onPressed: () => controller.isHiddenPass.toggle(),
                              color: Color(0xff136A5A),
                              icon: Icon(
                                controller.isHiddenPass.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => CheckboxListTile(
                          title: Text(
                            'Remember me',
                            style: TextStyle(
                              color: Color(0xff136A5A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: controller.isRemember.value,
                          onChanged: (value) => controller.isRemember.toggle(),
                          controlAffinity: ListTileControlAffinity.leading,
                          // checkColor: Colors.amber,
                          activeColor: Color(0xff136A5A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.cuboxIDTextController.text.isNotEmpty &&
                          controller
                              .cuboxAccKeyTextController.text.isNotEmpty) {
                        controller.cubox_ID =
                            controller.cuboxIDTextController.text;
                        controller.access_Key =
                            controller.cuboxAccKeyTextController.text;
                        print('${controller.cuboxID},${controller.accessKey} ');
                        if (controller.isRemember.value) {
                          final box = GetStorage();
                          box.write(
                            'dataUser',
                            {
                              'id': '${controller.cuboxIDTextController.text}',
                              'key':
                                  '${controller.cuboxAccKeyTextController.text}',
                              'remember': controller.isRemember.value,
                            },
                          );
                        } else {
                          final box = GetStorage();
                          //hapus storage
                          if (box.read('dataUser') != null) {
                            // box.erase();
                            box.write(
                              'dataUser',
                              {
                                'id': '',
                                'key': '',
                                'remember': controller.isRemember.value,
                              },
                            );
                          }
                        }
                        Get.toNamed(Routes.HOME);
                        // Get.offAllNamed(Routes.HOME);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Please check your cubox ID and Access Key!'),
                          ),
                        );
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      primary: Color(0xff136A5A),
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 35),
                  Text.rich(
                    TextSpan(text: 'Don\'t have an account yet ? ', children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Register');
                              Get.toNamed(Routes.REGISTER);
                              //Goto Register screen
                            },
                          text: 'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff136A5A),
                          ))
                    ]),
                  ),
                  // TextRich(''),

                  SizedBox(height: Get.height * .1), //Get.height * .20
                  // Text('want to put something?'),
                  // SizedBox(height: 10), //Get.height * .20
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.qr_code_scanner_rounded,
                  //     color: Color(0xff136A5A),
                  //     size: 35,
                  //   ),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // print('Courier ${Get.height}');
                  //   },
                  //   child: Icon(
                  //     Icons.qr_code_scanner_rounded,
                  //     color: Color(0xff136A5A),
                  //     size: 35,
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     side: BorderSide(color: Color(0xff136A5A), width: 3),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(
                  //         Radius.circular(15),
                  //       ),
                  //     ),
                  //     primary: Color(0xFF7BD2C3),
                  //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
