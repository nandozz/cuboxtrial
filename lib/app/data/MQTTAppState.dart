import 'package:flutter/cupertino.dart';

enum MQTTAppConnectionState { connected, disconnected, connecting }

class MQTTAppState with ChangeNotifier {
  MQTTAppConnectionState _appConnectionState =
      MQTTAppConnectionState.disconnected;
  String _receivedText = '';
  String _historyText = '';
  bool _isLock = true;
  // ignore: unused_field
  // ignore: always_specify_types
  String _updateList = '';
  String _boxID = '';
  String _boxPass = '';

  void setBox(String id, String pass) {
    _boxID = id;
    _boxPass = pass;
    notifyListeners();
  }

  void setReceivedText(String text) {
    _receivedText = text;

    if (text.contains('List')) {
      // _updateList = text.substring(5, text.length);
      _updateList = text;
    } else if (text.contains('listempty')) {
      _updateList = '';
    }
    if (text.contains('History')) {
      _historyText = text;
    } else if (text.contains('historyempty')) {
      _historyText = '';
    } else if (text.contains('Open')) {
      _isLock = false;
    } else if (text.contains('Close')) {
      _isLock = true;
    }
    notifyListeners();
  }

  void setAppConnectionState(MQTTAppConnectionState state) {
    _appConnectionState = state;
    notifyListeners();
  }

  void setClearHistoryText() {
    _historyText = '';
    notifyListeners();
  }

  void changeLock(bool isLock) {
    _isLock = !isLock;
    notifyListeners();
  }

  String get getUpdateList => _updateList;
  String get getReceivedText => _receivedText;
  String get getHistoryText => _historyText;
  bool get getState => _isLock;
  String get getBoxID => _boxID;
  String get getBoxPass => _boxPass;

  MQTTAppConnectionState get getAppConnectionState => _appConnectionState;
}
