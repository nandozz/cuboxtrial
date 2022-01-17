import 'package:get/get.dart';

class HomeController extends GetxController {
  // ignore: todo
  // TODO: Implement HomeController

  RxInt selectedIndex = 0.obs; //New = 0.obs;
  RxInt tabIndex = 0.obs;
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
  void changeTabIndex(int index) => tabIndex.value = index;
}
