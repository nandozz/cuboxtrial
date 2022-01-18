import 'dart:async';

import 'package:flutter/material.dart';
import 'app/modules/login/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = Duration(seconds: 2);
    return Timer(
      duration,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<LoginView>(
            builder: (BuildContext context) {
              return LoginView();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFC2E9E2),
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
                      color: Colors.black,
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
    );
  }
}
