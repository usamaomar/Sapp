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
    _safeInit(() {
      _fullStudentStateList = prefs
              .getStringList('ff_fullStudentStateList')
              ?.map((x) {
                try {
                  return FullStudentModelStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _fullStudentStateList;
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

  List<FullStudentModelStruct> _fullStudentStateList = [];
  List<FullStudentModelStruct> get fullStudentStateList =>
      _fullStudentStateList;
  set fullStudentStateList(List<FullStudentModelStruct> value) {
    _fullStudentStateList = value;
    prefs.setStringList(
        'ff_fullStudentStateList', value.map((x) => x.serialize()).toList());
  }

  void addToFullStudentStateList(FullStudentModelStruct value) {
    _fullStudentStateList.add(value);
    prefs.setStringList('ff_fullStudentStateList',
        _fullStudentStateList.map((x) => x.serialize()).toList());
  }

  void removeFromFullStudentStateList(FullStudentModelStruct value) {
    _fullStudentStateList.remove(value);
    prefs.setStringList('ff_fullStudentStateList',
        _fullStudentStateList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFullStudentStateList(int index) {
    _fullStudentStateList.removeAt(index);
    prefs.setStringList('ff_fullStudentStateList',
        _fullStudentStateList.map((x) => x.serialize()).toList());
  }

  void updateFullStudentStateListAtIndex(
    int index,
    FullStudentModelStruct Function(FullStudentModelStruct) updateFn,
  ) {
    _fullStudentStateList[index] = updateFn(_fullStudentStateList[index]);
    prefs.setStringList('ff_fullStudentStateList',
        _fullStudentStateList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFullStudentStateList(
      int index, FullStudentModelStruct value) {
    _fullStudentStateList.insert(index, value);
    prefs.setStringList('ff_fullStudentStateList',
        _fullStudentStateList.map((x) => x.serialize()).toList());
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
