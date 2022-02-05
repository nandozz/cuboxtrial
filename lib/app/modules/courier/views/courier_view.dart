import 'package:cubox/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'dart:math';

// import 'dart:io' show Platform;

import 'package:cubox/app/data/MQTTManager.dart';
import 'package:cubox/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';

import '../controllers/courier_controller.dart';

// ignore: must_be_immutable
class CourierView extends GetView<CourierController> {
  // String _scanBarcode = 'Unknown';

  final TextEditingController _qrcuboxIDTextController =
      TextEditingController();
  final TextEditingController _barcodeAccKeyTextController =
      TextEditingController();
  LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print('Back button pressed!');
        Future.delayed(
          const Duration(seconds: 2),
          () {
            controller.manager.disconnect();
          },
        );
        _qrcuboxIDTextController.clear();
        _barcodeAccKeyTextController.clear();
        Get.offAllNamed(Routes.LOGIN);

        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Obx(() => Text(
                controller.qrcode.value ? 'cubox scanner' : 'Parcel scanner')),
            elevation: 0,
            backgroundColor: Color(0xFF7BD2C3),
            centerTitle: true,
            actions: [
              Image.asset('assets/icons/cubox-icon.png'),
              SizedBox(
                width: 10,
              )
            ],
          ),
          backgroundColor: Colors.lightBlue[50], //Color(0xFF7BD2C3),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Obx(
                    () => Center(
                      child: Container(
                        width: 254,
                        height: 254,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: controller.qrcode.value
                              ? Image.asset('assets/images/cubox-scanning.png')
                              : //scan Barcode
                              Image.asset('assets/images/parcel-scanning.png'),
                        ),
                      ),
                      // Container(

                      //   child: Image.asset('assets/images/cubox.png'),
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'cubox ID',
                          style:
                              TextStyle(color: Color(0xff136A5A), fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        TextField(
                          //QR CUBOX
                          controller: _qrcuboxIDTextController,
                          // onEditingComplete: () =>
                          //     print('nih: ${_qrcuboxIDTextController.text}'),
                          onSubmitted: (data) {
                            // print('onsubmited: $data');
                            _configureAndConnect(data);

                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                if (data.contains('Failed') || data.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Please check your cuboxID field'),
                                    ),
                                  );
                                } else if (loginController
                                        .getAppConnectionState ==
                                    MQTTAppConnectionState.connected) {
                                  controller.setimage = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('scan your barcode resi'),
                                    ),
                                  );
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      _publishMessage('courier ping');
                                    },
                                  );
                                }
                              },
                            );
                          },
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff136A5A)),
                          enabled: true,
                          // controller: _cuboxIDTextController,
                          decoration: InputDecoration(
                            hintText: 'type or scan QR cubox',
                            suffixIcon: IconButton(
                              onPressed: () {
                                print('scanQR dong');
                                scanBarcodeNormal(
                                    _qrcuboxIDTextController); //scanQR(controller, mode);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 35,
                                color: Color(0xff136A5A),
                              ),
                            ),
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
                        // _buildTextFiedScan(
                        //     _qrcuboxIDTextController, 'type or scan QR cubox'),
                        const SizedBox(height: 20),
                        Text(
                          'No. Resi',
                          style:
                              TextStyle(color: Color(0xff136A5A), fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: _barcodeAccKeyTextController,

                          onEditingComplete: () {
                            print(_barcodeAccKeyTextController);
                          },
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff136A5A)),
                          enabled: true,
                          // controller: _cuboxIDTextController,
                          decoration: InputDecoration(
                            hintText: 'type or scan barcode resi',
                            suffixIcon: IconButton(
                              onPressed: () {
                                print('scanQR dong');
                                scanBarcodeNormal(
                                    _barcodeAccKeyTextController); //scanQR(controller, mode);
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 35,
                                color: Color(0xff136A5A),
                              ),
                            ),
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
                        // _buildTextFiedScan(_barcodeAccKeyTextController,
                        //     'type or scan barcode no.resi'),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_qrcuboxIDTextController.text.isEmpty ||
                                  _qrcuboxIDTextController.text
                                      .contains('Failed')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Please type/scan cubox\'s ID first !'),
                                  ),
                                );
                              } else if (_qrcuboxIDTextController
                                      .text.isNotEmpty &&
                                  loginController.getAppConnectionState ==
                                      MQTTAppConnectionState.disconnected) {
                                _configureAndConnect(
                                    _qrcuboxIDTextController.text);
                              } else if (_barcodeAccKeyTextController
                                      .text.isNotEmpty &&
                                  loginController.getAppConnectionState ==
                                      MQTTAppConnectionState.connected) {
                                _publishMessage(
                                    'courier ${_barcodeAccKeyTextController.text}');
                                controller.setimage = true;
                                _qrcuboxIDTextController.clear();
                                _barcodeAccKeyTextController.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Try to open the cubox now!'),
                                  ),
                                );
                                Future.delayed(
                                  const Duration(seconds: 2),
                                  () {
                                    controller.manager.disconnect();
                                    print('DISCONECTED now');
                                  },
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please type/scan No.Resi!'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                primary: Color(0xff136A5A),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 145, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            child: Text('Open'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _configureAndConnect(String id) {
    final Random random = Random();
    final int randomNumber = random.nextInt(100); // from 0 upto 99 included
    String osPrefix = 'cubox_courier$randomNumber';

    final String _topic = 'BokuBox/courier/$id';
    controller.manager = MQTTManager(
        host: 'broker.hivemq.com',
        // topic: who == 'user' ? _topic : _topiccourier,
        topic: _topic,
        identifier: osPrefix,
        state: loginController);
    controller.manager.initializeMQTTClient();
    controller.manager.connect();
  }

  void _publishMessage(String text) {
    // String osPrefix = 'Flutter_iOS';
    // if (Platform.isAndroid) {
    //   osPrefix = 'Flutter_Android';
    // }
    final String message = text;
    controller.manager.publish(message);
    // _qrcuboxIDTextController.clear();
    // _barcodeAccKeyTextController.clear();
    // manager.disconnect();
  }

///////////////////////////////////////////////

  Future<void> scanBarcodeNormal(TextEditingController textField) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      if (barcodeScanRes == '-1') {
        barcodeScanRes = 'Failed to read';
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if ( //!barcodeScanRes.contains('Failed') &&
        textField == _qrcuboxIDTextController) {
      _configureAndConnect(barcodeScanRes);
      controller.setimage = false;
    }
    textField.text = barcodeScanRes;
  }
}
