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
      _studentAppStateList = prefs
              .getStringList('ff_studentAppStateList')
              ?.map((x) {
                try {
                  return StudentModelStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _studentAppStateList;
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

  List<StudentModelStruct> _studentAppStateList = [];
  List<StudentModelStruct> get studentAppStateList => _studentAppStateList;
  set studentAppStateList(List<StudentModelStruct> value) {
    _studentAppStateList = value;
    prefs.setStringList(
        'ff_studentAppStateList', value.map((x) => x.serialize()).toList());
  }

  void addToStudentAppStateList(StudentModelStruct value) {
    _studentAppStateList.add(value);
    prefs.setStringList('ff_studentAppStateList',
        _studentAppStateList.map((x) => x.serialize()).toList());
  }

  void removeFromStudentAppStateList(StudentModelStruct value) {
    _studentAppStateList.remove(value);
    prefs.setStringList('ff_studentAppStateList',
        _studentAppStateList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromStudentAppStateList(int index) {
    _studentAppStateList.removeAt(index);
    prefs.setStringList('ff_studentAppStateList',
        _studentAppStateList.map((x) => x.serialize()).toList());
  }

  void updateStudentAppStateListAtIndex(
    int index,
    StudentModelStruct Function(StudentModelStruct) updateFn,
  ) {
    _studentAppStateList[index] = updateFn(_studentAppStateList[index]);
    prefs.setStringList('ff_studentAppStateList',
        _studentAppStateList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInStudentAppStateList(
      int index, StudentModelStruct value) {
    _studentAppStateList.insert(index, value);
    prefs.setStringList('ff_studentAppStateList',
        _studentAppStateList.map((x) => x.serialize()).toList());
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
