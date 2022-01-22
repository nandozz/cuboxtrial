import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }
MQTTAppConnectionState _appConnectionState =
    MQTTAppConnectionState.disconnected;

class LoginController extends GetxController {
  final isHiddenPass = true.obs;
  final _cuboxID = ''.obs;
  final _accessKey = ''.obs;

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
    }

    if (text.contains('List')) {
      // _updateList = text.substring(5, text.length);
      _onDelivery.value = text.split('.');

      _onDelivery.removeLast();
      _onDelivery.removeAt(0);
      addtodbList(_onDelivery);
      // _updateList.value = text;
    }
    if (text.contains('listempty')) {
      _dbList.clear();
      print('clear onDelivery nih');
      _updateList.value = '';
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

      // addtoReceived(Map() );
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
    _dateTime.value = DateFormat.yMMMd().format(DateTime.now());
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
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // void tooglePassView() => isHiddenPass.value = !isHiddenPass.value;
}
