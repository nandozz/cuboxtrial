import 'package:cubox/app/modules/home/controllers/home_controller.dart';
import 'package:cubox/app/modules/login/controllers/login_controller.dart';
import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final HomeController homeController = Get.find<HomeController>();
  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Logout?'),
            // ignore: always_specify_types
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  primary: Color(0xff136A5A),
                  side: BorderSide(
                    color: Color(0xff136A5A),
                    width: 2,
                  ),
                ),
                onPressed: () => Navigator.pop(context, false),
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  primary: Color(0xff136A5A),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text('Yes'),
                onPressed: () {
                  // currentAppState.setReceivedText('listempty');
                  // currentAppState.setReceivedText('historyempty');
                  // controller.manager.disconnect();
                  print('Back button in HOME pressed!');
                  Future.delayed(
                    const Duration(seconds: 2),
                    () {
                      homeController.manager.disconnect();
                    },
                  );

                  loginController.setReceivedText('');
                  loginController.cubox_ID = '';
                  loginController.access_Key = '';
                  // Get.offAllNamed(Routes.LOGIN);
                  return Navigator.pop(context, true);
                },
              ),
            ],
          ),
        );
    return WillPopScope(
      onWillPop: () async {
        final bool? shouldPop = await showWarning(context);
        shouldPop ?? homeController.manager.disconnect();
        return shouldPop ?? false;
      },
      child: Stack(
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
                    onTap: () async {
                      bool? shouldPop = false;

                      shouldPop = await showWarning(context);

                      if (shouldPop!) {
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            homeController.manager.disconnect();
                          },
                        );

                        loginController.setReceivedText('');
                        loginController.cubox_ID = '';
                        loginController.access_Key = '';
                        Get.offAllNamed(Routes.LOGIN);
                      }
                    },
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
                      Divider(
                        height: 20,
                        thickness: 3,
                        indent: 0,
                        endIndent: 0,
                        color: Color(0xff136A5A),
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
                                      homeController.close.value
                                          ? homeController.publishMessage(
                                              '${loginController.accessKey} open')
                                          : homeController.publishMessage(
                                              '${loginController.accessKey} close');
                                      homeController.close.toggle();
                                      // print('Box Open');
                                    },
                                    child: Container(
                                      width: 144,
                                      height: 144,
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: homeController.close.value
                                            ? Image.asset(
                                                'assets/images/cubox-lock-big.png')
                                            : Image.asset(
                                                'assets/images/cubox-unlock.png'),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            homeController.publishMessage(
                                                '${loginController.accessKey} reset');
                                          },
                                          child: Text(
                                            'Reset',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            homeController.publishMessage(
                                                '${loginController.accessKey} restart');
                                          },
                                          child: Text('Restart')),
                                    ],
                                  )
                                ],
                              ),
                              // SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: size.width * .5,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white54,
                                ),
                                child: Column(
                                  children: [
                                    //RECEIVED CLEAR
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: loginController
                                                .received.length
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff136A5A),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '/50',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff5C5C5C),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
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
                                      ],
                                    ),
                                    // SizedBox(height: 10),
                                    loginController.received.isEmpty
                                        ? Container()
                                        : ElevatedButton(
                                            onPressed: () {
                                              // print('Received was cleared');
                                              loginController.received.clear();
                                              homeController.publishMessage(
                                                  '${loginController.accessKey} clearhis');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              minimumSize:
                                                  Size(double.infinity, 40),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        10.0),
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
                                    //dbList CLEAR
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: loginController.dbList.length
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffF97B06),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '/50',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff5C5C5C),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
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
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    loginController.dbList.isEmpty
                                        ? Container()
                                        : ElevatedButton(
                                            onPressed: () {
                                              // print('dbList was cleared');
                                              loginController.dbList.clear();
                                              homeController.publishMessage(
                                                  '${loginController.accessKey} clearlist');
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              minimumSize:
                                                  Size(double.infinity, 40),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        10.0),
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
