// import 'dart:ffi';

import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  final TextEditingController _cuboxIDTextController = TextEditingController();
  final TextEditingController _cuboxPassTextController =
      TextEditingController();

  bool isHiddenPass = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final statusBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Color(0xFF7BD2C3),
      // appBar: AppBar(
      //   title: Text('LoginView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Image.asset('assets/images/cubox.png'),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  // padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'cubox ID',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff136A5A)),
                        enabled: true,
                        controller: _cuboxIDTextController,
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
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: isHiddenPass,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff136A5A)),
                        enabled: true,
                        controller: _cuboxPassTextController,
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
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: Icon(
                              isHiddenPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // print('Login');
                    Get.toNamed(Routes.HOME);
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
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Text('Can\'t login? '),
                      Text(
                        'Register Here',
                        style: TextStyle(color: Color(0xff136A5A)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * .20), //size.height * .20
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  color: Color(0xFF7BD2C3),
                  height: size.height * .15,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Courier ${size.height}');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Courier',
                          style: TextStyle(
                            color: Color(0xff136A5A),
                          ),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.qr_code,
                          color: Color(0xff136A5A),
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Color(0xff136A5A), width: 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(35),
                          ),
                        ),
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        textStyle: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
