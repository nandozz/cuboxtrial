import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConfigurationController extends GetxController {
  RxBool numberInputValid = false.obs;
  RxBool isHidPass = true.obs;
  RxBool isPinAccess = true.obs;
  var _ssidList = ['Thanks God', 'Free'].obs; // Option 2
  final _selectedSSID = Rxn<String>(); // Option 2
  TextEditingController passwordWifi = TextEditingController();
  TextEditingController pinAccess = TextEditingController();
  // TextEditingController accessKey = TextEditingController();

  List get ssid => _ssidList;
  String? get selectedSSID => _selectedSSID.value;
  void set setSSID(String loc) {
    _selectedSSID.value = loc;
  }

  void loadData() {
    // Wifi.list('').then((list) {
    //   _ssidList.value = list;
    //   print(_ssidList);
    // });
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // print('password WIFi: ${passwordWifi.text}');
    // print('Access Key: ${accessKey.text}');
    passwordWifi.dispose();
    // accessKey.dispose();
    pinAccess.dispose();
  }
}
