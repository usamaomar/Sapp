import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
    _safeInit(() {
      _isLiveLocationStarted =
          prefs.getBool('ff_isLiveLocationStarted') ?? _isLiveLocationStarted;
    });
    _safeInit(() {
      _isGoStateIsSet = prefs.getBool('ff_isGoStateIsSet') ?? _isGoStateIsSet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserModelStruct _UserModelState = UserModelStruct();
  UserModelStruct get UserModelState => _UserModelState;
  set UserModelState(UserModelStruct _value) {
    _UserModelState = _value;
    prefs.setString('ff_UserModelState', _value.serialize());
  }

  void updateUserModelStateStruct(Function(UserModelStruct) updateFn) {
    updateFn(_UserModelState);
    prefs.setString('ff_UserModelState', _UserModelState.serialize());
  }

  TokenModelStruct _TokenModelState = TokenModelStruct();
  TokenModelStruct get TokenModelState => _TokenModelState;
  set TokenModelState(TokenModelStruct _value) {
    _TokenModelState = _value;
    prefs.setString('ff_TokenModelState', _value.serialize());
  }

  void updateTokenModelStateStruct(Function(TokenModelStruct) updateFn) {
    updateFn(_TokenModelState);
    prefs.setString('ff_TokenModelState', _TokenModelState.serialize());
  }

  List<ParentModelStruct> _fullParentStateList = [];
  List<ParentModelStruct> get fullParentStateList => _fullParentStateList;
  set fullParentStateList(List<ParentModelStruct> _value) {
    _fullParentStateList = _value;
    prefs.setStringList(
        'ff_fullParentStateList', _value.map((x) => x.serialize()).toList());
  }

  void addToFullParentStateList(ParentModelStruct _value) {
    _fullParentStateList.add(_value);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void removeFromFullParentStateList(ParentModelStruct _value) {
    _fullParentStateList.remove(_value);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromFullParentStateList(int _index) {
    _fullParentStateList.removeAt(_index);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void updateFullParentStateListAtIndex(
    int _index,
    ParentModelStruct Function(ParentModelStruct) updateFn,
  ) {
    _fullParentStateList[_index] = updateFn(_fullParentStateList[_index]);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInFullParentStateList(
      int _index, ParentModelStruct _value) {
    _fullParentStateList.insert(_index, _value);
    prefs.setStringList('ff_fullParentStateList',
        _fullParentStateList.map((x) => x.serialize()).toList());
  }

  bool _isLiveLocationStarted = false;
  bool get isLiveLocationStarted => _isLiveLocationStarted;
  set isLiveLocationStarted(bool _value) {
    _isLiveLocationStarted = _value;
    prefs.setBool('ff_isLiveLocationStarted', _value);
  }

  bool _isGoStateIsSet = false;
  bool get isGoStateIsSet => _isGoStateIsSet;
  set isGoStateIsSet(bool _value) {
    _isGoStateIsSet = _value;
    prefs.setBool('ff_isGoStateIsSet', _value);
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
