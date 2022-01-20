// import 'package:cubox/app/routes/app_pages.dart';
// import 'package:cubox/app/data/MQTTAppState.dart';
// import 'package:cubox/app/data/MQTTManager.dart';
// import 'dart:ui';

import 'dart:async';
import 'dart:math';

import 'package:cubox/app/data/MQTTManager.dart';
import 'package:cubox/app/modules/login/controllers/login_controller.dart';
import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../profile/views/profile_view.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  final TextEditingController _noResiTextController = TextEditingController();
  late MQTTManager manager;
  LoginController loginController = Get.find<LoginController>();

  // String _prepareStateMessageFrom(MQTTAppConnectionState state,
  //     {String id = '', String key = ''}) {
  //   switch (state) {
  //     case MQTTAppConnectionState.connected:
  //       return 'Connected';
  //     case MQTTAppConnectionState.connecting:
  //       return 'Connecting';
  //     case MQTTAppConnectionState.disconnected:
  //       return 'Disconnected';
  //   }
  // }

  void _publishMessage(String text) {
    // String osPrefix = 'Flutter_iOS';
    // if (Platform.isAndroid) {
    //   osPrefix = 'Flutter_Android';
    // }
    final String message = text;
    manager.publish(message);
    // _newCodeTextController.clear();
  }

  void _configureAndConnect(String id, String key) {
    final Random random = Random();
    final int randomNumber = random.nextInt(100); // from 0 upto 99 included
    String osPrefix = 'cubox_User$randomNumber';

    final String _topic = 'BokuBox/$key/$id';
    manager = MQTTManager(
        host: 'broker.hivemq.com',
        // topic: who == 'user' ? _topic : _topiccourier,
        topic: _topic,
        identifier: osPrefix,
        state: loginController);
    manager.initializeMQTTClient();
    manager.connect();
    // ignore: always_specify_types
    // Future.delayed(
    //   Duration.zero,
    //   () {
    //     manager.initializeMQTTClient();
    //     manager.connect();
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // int _selectedIndex = 0; //New
    final size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      initState: (state) {
        _configureAndConnect(
            loginController.cuboxID, loginController.accessKey);

        Future.delayed(
          const Duration(seconds: 2),
          () {
            // 5 seconds over, navigate to Page2.
            _publishMessage('${loginController.accessKey} ping');
          },
        );
      },
      builder: (controller) => Scaffold(
        backgroundColor: Colors.lightBlue[50],
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: Colors.white, //Color(0xff7BD2C3),
            selectedItemColor: Color(0xff136A5A),
            unselectedItemColor: Color(0xff868788), //Colors.white,
            currentIndex: controller.selectedIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  // color: Color(0xff136A5A),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              controller.change(index);
            },
          ),
        ),
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: controller.selectedIndex.value,
              children: [
                SingleChildScrollView(
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
                          color: Color(0xff7BD2C3),
                          // border: Border(
                          //   top: BorderSide.none,
                          //   bottom: BorderSide(
                          //       color: Color(0xff136A5A),
                          //       width: 3,
                          //       style: BorderStyle.solid),
                          // ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Positioned(
                              // left: 12,
                              // top: 24,
                              child: GestureDetector(
                                onTap: () {
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      manager.disconnect();
                                    },
                                  );

                                  loginController.setReceivedText('');
                                  loginController.cubox_ID = '';
                                  loginController.access_Key = '';
                                  Get.offAllNamed(Routes.LOGIN);
                                },
                                child: Image.asset('assets/icons/logout.png'),
                              ),
                            ),
                            Text(
                              loginController.getConnectionStatus,
                              style: TextStyle(fontSize: 25),
                            ),
                            Positioned(
                              // left: 112,
                              // top: 24,
                              child: GestureDetector(
                                onTap: () {},
                                child:
                                    Image.asset('assets/icons/cubox-icon.png'),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                //A1234
                                loginController.cuboxID,
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Text(//message MQTT
                              //   loginController.getReceivedText,
                              //   style: TextStyle(
                              //     fontSize: 35,
                              //     color: Colors.white,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              SizedBox(height: 70),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add New Resi',
                                    style: TextStyle(
                                        color: Color(0xff136A5A),
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 300,
                                        child: TextField(
                                          controller: _noResiTextController,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff5C5C5C)),
                                          decoration: InputDecoration(
                                            hintText: 'No. Resi',
                                            hintStyle: TextStyle(
                                              color: Color(0xff9C9C9C),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xff136A5A),
                                                width: 3,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xff136A5A),
                                                width: 3,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 10,
                                                    bottom: 0,
                                                    top: 0,
                                                    right: 0),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (_noResiTextController
                                                  .text.isEmpty ||
                                              loginController
                                                      .getConnectionStatus ==
                                                  'Not-Connected') {
                                            _publishMessage(
                                                '${loginController.accessKey} ping');
                                          } else {
                                            _publishMessage(
                                                '${loginController.accessKey} add ${_noResiTextController.text}');
                                            //ADD
                                            loginController.addtodbList([
                                              '${_noResiTextController.text}'
                                            ]);

                                            _noResiTextController.clear();
                                          }
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          Icons.add_box_outlined,
                                          size: 45,
                                          color: Color(0xff136A5A),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //Tab Controller
                                  DefaultTabController(
                                    length: 3, // length of tabs
                                    initialIndex: 0,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: TabBar(
                                            indicatorColor: Color(0xff136A5A),
                                            labelColor: Color(0xff136A5A),
                                            unselectedLabelColor:
                                                Color(0xff868788),
                                            tabs: [
                                              Tab(text: 'All Status'),
                                              Tab(text: 'On Delivery'),
                                              Tab(text: 'Received'),
                                            ],
                                          ),
                                        ),
                                        // SizedBox(height: 10),

                                        //TabBarView
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 20, bottom: 50),
                                          height: size.height *
                                              .5, //height of TabBarView
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Colors.grey,
                                                      width: 0.5))),
                                          child: Obx(
                                            () => TabBarView(
                                              children: <Widget>[
                                                // ALL STATUS - VIEW
                                                loginController.dbList.isEmpty &
                                                        loginController
                                                            .received.isEmpty
                                                    ? Text(
                                                        'No data',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            // fontSize: 18,
                                                            ),
                                                      )
                                                    : Container(
                                                        child: Obx(
                                                          () =>
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Column(
                                                                  //All Status - received
                                                                  children: loginController
                                                                      .received
                                                                      .reversed
                                                                      .map(
                                                                    (data) {
                                                                      return Column(
                                                                        children: [
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(10),
                                                                              ),
                                                                              color: Color(0xffF1FDFB),
                                                                            ),
                                                                            child:
                                                                                ListTile(
                                                                              title: Text("${data['number']}"),
                                                                              subtitle: Text("${data['date']}"),
                                                                              trailing: GestureDetector(
                                                                                onLongPress: () => loginController.received.remove(data),
                                                                                child: Container(
                                                                                  padding: EdgeInsets.all(10),
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xff2F924B),
                                                                                    borderRadius: BorderRadius.all(
                                                                                      Radius.circular(10),
                                                                                    ),
                                                                                  ),
                                                                                  height: 40,
                                                                                  child: Text(
                                                                                    'Received',
                                                                                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                10,
                                                                          )
                                                                        ],
                                                                      );
                                                                    },
                                                                  ).toList(),
                                                                ),
                                                                //All Status - dbList
                                                                Column(
                                                                  children:
                                                                      loginController
                                                                          .dbList
                                                                          .reversed
                                                                          .map(
                                                                    (data) {
                                                                      return SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(
                                                                                  Radius.circular(10),
                                                                                ),
                                                                                color: Color(0xffF1FDFB),
                                                                              ),
                                                                              child: ListTile(
                                                                                title: Text(data),
                                                                                trailing: GestureDetector(
                                                                                  onLongPress: () {
                                                                                    // print('nih longpress Allstatus');
                                                                                    // print('nih ${loginController.dateTime}');
                                                                                    loginController.dateNow();
                                                                                    loginController.addtoReceived({
                                                                                      'number': '$data',
                                                                                      'date': '${loginController.dateTime}'
                                                                                      // 'date': '5/5/2222'
                                                                                    });
                                                                                    loginController.dbList.remove(data);
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: EdgeInsets.all(10),
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0xffF97B06),
                                                                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                    ),
                                                                                    height: 40,
                                                                                    child: Text(
                                                                                      'On Delivery',
                                                                                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).toList(),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                // dbList VIEW
                                                loginController.dbList.isEmpty
                                                    ? Text(
                                                        'No data',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            // fontSize: 18,
                                                            ),
                                                      )
                                                    : Container(
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children:
                                                                loginController
                                                                    .dbList
                                                                    .reversed
                                                                    .map(
                                                              (data) {
                                                                return Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              10),
                                                                        ),
                                                                        color: Color(
                                                                            0xffF1FDFB),
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title: Text(
                                                                            data),
                                                                        trailing:
                                                                            GestureDetector(
                                                                          onLongPress: () => loginController
                                                                              .dbList
                                                                              .remove(data),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40,
                                                                            padding:
                                                                                EdgeInsets.all(10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xffF97B06),
                                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'On Delivery',
                                                                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                            ).toList(),
                                                          ),
                                                        ),
                                                      ),
                                                loginController.received.isEmpty
                                                    ? Text(
                                                        'No data',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            // fontSize: 18,
                                                            ),
                                                      )
                                                    :
                                                    //RECEIVED VIEW
                                                    Container(
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children:
                                                                loginController
                                                                    .received
                                                                    .reversed
                                                                    .map(
                                                              (data) {
                                                                return Column(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              10),
                                                                        ),
                                                                        color: Color(
                                                                            0xffF1FDFB),
                                                                      ),
                                                                      child:
                                                                          ListTile(
                                                                        title: Text(
                                                                            "${data['number']}"),
                                                                        subtitle:
                                                                            Text("${data['date']}"),
                                                                        trailing:
                                                                            GestureDetector(
                                                                          onLongPress: () => loginController
                                                                              .received
                                                                              .remove(data),
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.all(10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xff2F924B),
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(10),
                                                                              ),
                                                                            ),
                                                                            height:
                                                                                40,
                                                                            child:
                                                                                Text(
                                                                              'Received',
                                                                              style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    )
                                                                  ],
                                                                );
                                                              },
                                                            ).toList(),
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                ),

                // PROFILE
                ProfileView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
