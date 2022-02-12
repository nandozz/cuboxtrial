import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConfigurationController extends GetxController {
  RxBool isHidPass = true.obs;
  RxBool isAccKey = true.obs;
  var _locations = ['Wi-Fi A', 'Wi-Fi B', 'Wi-Fi C', 'Wi-Fi D'].obs; // Option 2
  final _selectedLocation = Rxn<String>(); // Option 2
  TextEditingController passwordWifi = TextEditingController();
  TextEditingController accessKey = TextEditingController();

  List get location => _locations;
  String? get selectedLocation => _selectedLocation.value;
  void set setLocation(String loc) {
    _selectedLocation.value = loc;
  }

  @override
  void onInit() {
    super.onInit();
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
    accessKey.dispose();
  }
}
