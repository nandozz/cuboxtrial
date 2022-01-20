import 'package:get/get.dart';

class HomeController extends GetxController {
  // ignore: todo
  // TODO: Implement HomeController
  // RxList onDelivery = [].obs;
  // RxList received = [
  //   // {
  //   //   'number': 'AAAAAAAAA',
  //   //   'date': '1/1/2022',
  //   // },
  //   // {
  //   //   'number': 'BBBBB',
  //   //   'date': '1/1/2022',
  //   // },
  // ].obs;

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
}
