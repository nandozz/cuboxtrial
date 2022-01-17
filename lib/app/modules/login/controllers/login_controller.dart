import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final ishidePass = false.obs;
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

  void tooglePassView() => ishidePass.value = !ishidePass.value;
}
