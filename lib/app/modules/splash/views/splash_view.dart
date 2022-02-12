import 'dart:async';
import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

// ignore: must_be_immutable
class SplashView extends GetView<SplashController> {
  var duration = Duration(seconds: 2);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      initState: (state) {
        Timer(
          duration,
          () {
            Get.offNamed(Routes.LOGIN);
          },
        );
      },
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00DDD0), Color(0xff0E2625)]),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 125, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/images/splash-image.png'),
                    Text(
                      'Your parcel receiver',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'cubox',
                      style: TextStyle(
                        letterSpacing: 55,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
