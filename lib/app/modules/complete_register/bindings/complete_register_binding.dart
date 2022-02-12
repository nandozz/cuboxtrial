import 'package:get/get.dart';

import '../controllers/complete_register_controller.dart';

class CompleteRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteRegisterController>(
      () => CompleteRegisterController(),
    );
  }
}
