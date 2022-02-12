import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pairing_controller.dart';

class PairingView extends GetView<PairingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pairing',
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
                Image.asset('assets/images/cubox-DeviceID.png'),
                SizedBox(
                  height: 55,
                ),
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
                      text: '1. Select ',
                      children: [
                        TextSpan(
                          text: 'cubox-DeviceID',
                          style: TextStyle(
                            color: Color(0xff136A5A),
                          ),
                        ),
                        TextSpan(
                          text: ' on your WiFi setting.\n',
                          style: TextStyle(
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                        TextSpan(
                          text: '2. Enter the ',
                          style: TextStyle(
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                        TextSpan(
                          text: 'password ',
                          style: TextStyle(
                            color: Color(0xff136A5A),
                          ),
                        ),
                        TextSpan(
                          text: '- look at the ',
                          style: TextStyle(
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                        TextSpan(
                          text: 'warranty card.\n',
                          style: TextStyle(
                            color: Color(0xff136A5A),
                          ),
                        ),
                        TextSpan(
                          text: '3. Click ',
                          style: TextStyle(
                            color: Color(0xff5B5B5B),
                          ),
                        ),
                        TextSpan(
                          text: 'Wifi Setting.',
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
              Get.toNamed(Routes.CONFIGURATION);
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Wifi Setting',
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
