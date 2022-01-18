import 'package:cubox/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ProfileView'),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 75),
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(125),
                bottomRight: Radius.circular(125),
              ),
              // border: Border(
              //   top: BorderSide.none,
              //   bottom: BorderSide(
              //       color: Color(0xff136A5A),
              //       width: 3,
              //       style: BorderStyle.solid),
              // ),
              color: Color(0xff7BD2C3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Positioned(
                  // left: 12,
                  // top: 24,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset('assets/icons/logout.png'),
                  ),
                ),
                Positioned(
                  // left: 112,
                  // top: 24,
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/icons/cubox-icon.png'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 75,
              left: 15,
              right: 15,
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Control',
                        style: TextStyle(
                            color: Color(0xff136A5A),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        // print('Box Open');
                                      },
                                      child: Image.asset(
                                          'assets/images/cubox-lock.png')),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Reset',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('Restart')),
                                    ],
                                  )
                                ],
                              ),
                              // SizedBox(width: 10),
                              Container(
                                width: size.width * .5,
                                child: Column(
                                  children: [
                                    //RECEIVED CLEAR
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xff2F924B),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Text(
                                            'Received',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        // SizedBox(width: 50),
                                        Text.rich(
                                          TextSpan(
                                            text: homeController.received.length
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff136A5A),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '/10',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff5C5C5C),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        // print('Received was cleared');
                                        homeController.received.clear();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        minimumSize: Size(double.infinity, 40),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    //ONDELIVERY CLEAR
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF97B06),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Text(
                                            'On Delivery',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        // SizedBox(width: 50),
                                        Text.rich(
                                          TextSpan(
                                            text: homeController
                                                .onDelivery.length
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffF97B06),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '/10',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff5C5C5C),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        // print('onDelivery was cleared');
                                        homeController.onDelivery.clear();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        minimumSize: Size(double.infinity, 40),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
