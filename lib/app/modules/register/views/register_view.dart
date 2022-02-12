import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF7BD2C3),
        actions: [
          Image.asset('assets/icons/cubox-connected.png'),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 50),
            height: 20,
            decoration: BoxDecoration(
              color: Color(0xFF7BD2C3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Container(
            // color: Colors.amberAccent,
            padding: EdgeInsets.only(bottom: 30),
            margin: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Instruction',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff136A5A),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      text:
                          '1. Connect the device to power.\n2. Make sure the device is in the ',
                      children: [
                        TextSpan(
                          text: 'pairing mode',
                          style: TextStyle(
                            color: Color(0xff136A5A),
                          ),
                        ),
                        TextSpan(
                          text: ' \n\t\t\t\t- check the display.\n3. Click ',
                          style: TextStyle(
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                        TextSpan(
                          text: 'Start Pairing.',
                          style: TextStyle(
                            color: Color(0xff136A5A),
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 15,
                        color: Color(0xff5B5B5B),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 70,
                  width: 250,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff4E4E4E),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    'Note: If the device was previously connected, reset it to factory settings by pressing the reset button',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: const Color(0xff136A5A),
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.PAIRING);
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Start Pairing',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
