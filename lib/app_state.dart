import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserModelState')) {
        try {
          final serializedData = prefs.getString('ff_UserModelState') ?? '{}';
          _UserModelState =
              UserModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_TokenModelState')) {
        try {
          final serializedData = prefs.getString('ff_TokenModelState') ?? '{}';
          _TokenModelState =
              TokenModelStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserModelStruct _UserModelState = UserModelStruct();
  UserModelStruct get UserModelState => _UserModelState;
  set UserModelState(UserModelStruct value) {
    _UserModelState = value;
    prefs.setString('ff_UserModelState', value.serialize());
  }

  void updateUserModelStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_UserModelState);
    prefs.setString('ff_UserModelState', _UserModelState.serialize());
  }

  TokenModelStruct _TokenModelState = TokenModelStruct();
  TokenModelStruct get TokenModelState => _TokenModelState;
  set TokenModelState(TokenModelStruct value) {
    _TokenModelState = value;
    prefs.setString('ff_TokenModelState', value.serialize());
  }

  void updateTokenModelStateStruct(Function(TokenModelStruct) updateFn) {
    updateFn(_TokenModelState);
    prefs.setString('ff_TokenModelState', _TokenModelState.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
