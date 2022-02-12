import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complete_register_controller.dart';

class CompleteRegisterView extends GetView<CompleteRegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configuration',
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
                Image.asset('assets/images/successfully.png'),
                SizedBox(
                  height: 55,
                ),
                Text(
                  'Configuration Status',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff136A5A),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Successfully',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff136A5A),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 70,
                  width: 275,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff4E4E4E),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Your device will be restarted. Please wait until all the process is complete.',
                      style: TextStyle(color: Colors.white),
                    ),
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
              Get.offAllNamed(Routes.LOGIN);
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Login',
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
