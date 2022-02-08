import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }
MQTTAppConnectionState _appConnectionState =
    MQTTAppConnectionState.disconnected;

class LoginController extends GetxController {
  final isHiddenPass = true.obs;
  final isRemember = false.obs;
  final isConnected = false.obs;

  final _cuboxID = ''.obs;
  final _accessKey = ''.obs;
  late TextEditingController cuboxIDTextController;
  late TextEditingController cuboxAccKeyTextController;

  var _dbList = [].obs;
  final _onDelivery = [].obs;
  final _received = [].obs;
  final _justReceived = [].obs;

  final _connection = 'Not-Connected'.obs;
  final _receivedText = ''.obs;
  final _historyText = ''.obs;
  final _isLock = true.obs;
  final _updateList = ''.obs;
  var _dateTime = ''.obs;

  ////////////////////////////////////

  void setBox(String id, String pass) {
    _cuboxID.value = id;
    _accessKey.value = pass;
  }

  void setReceivedText(String text) {
    _receivedText.value = text;
    // print('nih $text');

    // print('RECEIVED : $text');

    if (text.contains('connected')) {
      _connection.value = 'Connected';
      isConnected.value = true;
    }
    if (text.contains('listempty')) {
      _dbList.clear();
      print('clear onDelivery nih');
      _updateList.value = '';
    }

    if (text.contains('List')) {
      // _updateList = text.substring(5, text.length);
      _onDelivery.value = text.split('.');

      _onDelivery.removeLast();
      _onDelivery.removeAt(0);
      addtodbList(_onDelivery);
      // _updateList.value = text;
    }

    if (text.contains('JustReceived')) {
      dateNow();
      // JustReceived:A
      _justReceived.value = text.split(':');
      // _justReceived.removeLast();
      // _justReceived.removeAt(0);
      // print("nih 'number': '${_justReceived[1]}', 'date': '${_dateTime}'");
      _dbList.remove(_justReceived[1]);

      addtoReceived({'number': '${_justReceived[1]}', 'date': '${_dateTime}'});
      _dbList.remove('${_justReceived[1]}');
      Get.snackbar(
        "",
        '',
        titleText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cubox : New Parcel',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${_dateTime}',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('ID: ${_justReceived[1]}')
          ],
        ),
        backgroundColor: Colors.lightBlue[50],
      );
      // print('nih received: ${_received[0]}');

      // _historyText.value = text;
    }
    if (text.contains('historyempty')) {
      _received.clear();
      _historyText.value = '';
    } else if (text.contains('Open')) {
      _isLock.value = false;
    } else if (text.contains('Close')) {
      _isLock.value = true;
    }
  }

  void addtodbList(List data) {
    _dbList.value = List.from(_dbList)..addAll(data);
    _dbList.value = _dbList.toSet().toList();

    // print("nih dbList : ${_dbList}");
  }

  void addtoReceived(Map data) {
    _received.add(data);

    // print("nih received history: ${_received}");
  }

  void removefromReceived(String data) {
    _received.remove(data);
  }

  void dateNow() {
    _dateTime.value = DateFormat.MMMd().add_jm().format(DateTime.now());
    // print('nih dateTime: ${_dateTime}');
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
  }

  void setClearHistoryText() {
    _historyText.value = '';
  }

  void changeLock(bool isLock) {
    _isLock.value = !isLock;
  }

  List get dbList => _dbList;
  List get onDelivery => _onDelivery;
  List get received => _received;
  String get dateTime => _dateTime.value;

  String get getConnectionStatus => _connection.value;
  String get getReceivedText => _receivedText.value;
  bool get getState => _isLock.value;
  // String get getBoxID => _boxID.value;
  // String get getBoxPass => _boxPass.value;

  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;

  ////////////////////////////////////

  void set cubox_ID(String id) {
    _cuboxID.value = id;
  }

  void set access_Key(String acc) {
    _accessKey.value = acc;
  }

  String get cuboxID => _cuboxID.value;
  String get accessKey => _accessKey.value;

  @override
  void onInit() async {
    cuboxIDTextController = TextEditingController();
    cuboxAccKeyTextController = TextEditingController();
    super.onInit();
    await GetStorage.init();
    final box = GetStorage();
    //READ Storage
    if (box.read('dataUser') != null) {
      final data = box.read('dataUser') as Map<String, dynamic>;
      cuboxIDTextController.text = data['id'];
      cuboxAccKeyTextController.text = data['key'];
      isRemember.value = data['remember'];
      _received.value = data['received'];
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void tooglePassView() => isHiddenPass.value = !isHiddenPass.value;
}
