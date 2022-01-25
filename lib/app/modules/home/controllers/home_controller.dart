import 'dart:math';

import 'package:cubox/app/data/MQTTManager.dart';
import 'package:cubox/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late MQTTManager manager;
  LoginController loginController = Get.find<LoginController>();

  RxInt selectedIndex = 0.obs; //New = 0.obs;
  final close = true.obs;
  // RxInt tabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void change(int index) => selectedIndex.value = index;
  // void changeTabIndex(int index) => tabIndex.value = index;

  void publishMessage(String text) {
    // String osPrefix = 'Flutter_iOS';
    // if (Platform.isAndroid) {
    //   osPrefix = 'Flutter_Android';
    // }
    final String message = text;
    manager.publish(message);
    // _newCodeTextController.clear();
  }

  void configureAndConnect(String id, String key) {
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
    //    manager.initializeMQTTClient();
    //    manager.connect();
    //   },
    // );
  }
}
