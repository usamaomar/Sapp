// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyStudentListModelStruct extends BaseStruct {
  MyStudentListModelStruct({
    List<MyStudentsStruct>? myStudents,
  }) : _myStudents = myStudents;

  // "my_students" field.
  List<MyStudentsStruct>? _myStudents;
  List<MyStudentsStruct> get myStudents => _myStudents ?? const [];
  set myStudents(List<MyStudentsStruct>? val) => _myStudents = val;
  void updateMyStudents(Function(List<MyStudentsStruct>) updateFn) =>
      updateFn(_myStudents ??= []);
  bool hasMyStudents() => _myStudents != null;

  static MyStudentListModelStruct fromMap(Map<String, dynamic> data) =>
      MyStudentListModelStruct(
        myStudents: getStructList(
          data['my_students'],
          MyStudentsStruct.fromMap,
        ),
      );

  static MyStudentListModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MyStudentListModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'my_students': _myStudents?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'my_students': serializeParam(
          _myStudents,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static MyStudentListModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MyStudentListModelStruct(
        myStudents: deserializeStructParam<MyStudentsStruct>(
          data['my_students'],
          ParamType.DataStruct,
          true,
          structBuilder: MyStudentsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MyStudentListModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MyStudentListModelStruct &&
        listEquality.equals(myStudents, other.myStudents);
  }

  @override
  int get hashCode => const ListEquality().hash([myStudents]);
}

MyStudentListModelStruct createMyStudentListModelStruct() =>
    MyStudentListModelStruct();
