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
      _FCM = prefs.getString('ff_FCM') ?? _FCM;
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
    // _safeInit(() {
    //   _isGoStateIsSet = prefs.getBool('ff_isGoStateIsSet') ?? _isGoStateIsSet;
    // });
    _safeInit(() {
      _slectedLanguge = prefs.getString('ff_slectedLanguge') ?? _slectedLanguge;
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

  String _FCM = '';

  String get FCM => _FCM;

  set FCM(String _value) {
    _FCM = _value;
    prefs.setString('ff_FCM', _value);
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

  bool _isLiveLocationStarted = false;
  bool get isLiveLocationStarted => _isLiveLocationStarted;
  set isLiveLocationStarted(bool value) {
    _isLiveLocationStarted = value;
    prefs.setBool('ff_isLiveLocationStarted', value);
  }

  // bool _isGoStateIsSet = false;
  // bool get isGoStateIsSet => _isGoStateIsSet;
  // set isGoStateIsSet(bool value) {
  //   _isGoStateIsSet = value;
  //   prefs.setBool('ff_isGoStateIsSet', value);
  // }
  bool _isGoStateIsSet = false;
  bool get isGoStateIsSet => _isGoStateIsSet;
  set isGoStateIsSet(bool value) {
    _isGoStateIsSet = value;
    prefs.setBool('ff_isGoStateIsSet', value);
  }

  String _slectedLanguge = 'ar';
  String get slectedLanguge => _slectedLanguge;
  set slectedLanguge(String value) {
    _slectedLanguge = value;
    prefs.setString('ff_slectedLanguge', value);
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
