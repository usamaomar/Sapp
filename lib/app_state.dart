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
      _fullParentStateList = prefs
              .getStringList('ff_fullParentStateList')
              ?.map((x) {
                try {
                  return ParentModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _fullParentStateList;
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

  List<ParentModelStruct> _fullParentStateList = [];
  List<ParentModelStruct> get fullParentStateList => _fullParentStateList;
  set fullParentStateList(List<ParentModelStruct> value) {
    _fullParentStateList = value;
    prefs.setStringList(
        'ff_fullParentStateList', value.map((x) => x.serialize()).toList());
  }

  void addToFullParentStateList(ParentModelStruct value) {
    _fullParentStateList.add(value);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void removeFromFullParentStateList(ParentModelStruct value) {
    _fullParentStateList.remove(value);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFullParentStateList(int index) {
    _fullParentStateList.removeAt(index);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void updateFullParentStateListAtIndex(
    int index,
    ParentModelStruct Function(ParentModelStruct) updateFn,
  ) {
    _fullParentStateList[index] = updateFn(_fullParentStateList[index]);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFullParentStateList(
      int index, ParentModelStruct value) {
    _fullParentStateList.insert(index, value);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
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