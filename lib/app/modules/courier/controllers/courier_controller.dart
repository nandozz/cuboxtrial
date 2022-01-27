import 'package:cubox/app/data/MQTTManager.dart';
import 'package:get/get.dart';

class CourierController extends GetxController {
  RxBool _qrcode = true.obs;

  late MQTTManager manager;

  void set setimage(bool qr) {
    _qrcode.value = qr;
  }

  get qrcode => _qrcode;

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
    print('ONCLOSE COURIER DISCONNECT');
    manager.disconnect();
  }
}
