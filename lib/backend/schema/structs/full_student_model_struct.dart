// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FullStudentModelStruct extends BaseStruct {
  FullStudentModelStruct({
    StudentModelStruct? student,
    ParentModelStruct? parent,
  })  : _student = student,
        _parent = parent;

  // "student" field.
  StudentModelStruct? _student;
  StudentModelStruct get student => _student ?? StudentModelStruct();
  set student(StudentModelStruct? val) => _student = val;
  void updateStudent(Function(StudentModelStruct) updateFn) =>
      updateFn(_student ??= StudentModelStruct());
  bool hasStudent() => _student != null;

  // "parent" field.
  ParentModelStruct? _parent;
  ParentModelStruct get parent => _parent ?? ParentModelStruct();
  set parent(ParentModelStruct? val) => _parent = val;
  void updateParent(Function(ParentModelStruct) updateFn) =>
      updateFn(_parent ??= ParentModelStruct());
  bool hasParent() => _parent != null;

  static FullStudentModelStruct fromMap(Map<String, dynamic> data) =>
      FullStudentModelStruct(
        student: StudentModelStruct.maybeFromMap(data['student']),
        parent: ParentModelStruct.maybeFromMap(data['parent']),
      );

  static FullStudentModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FullStudentModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'student': _student?.toMap(),
        'parent': _parent?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'student': serializeParam(
          _student,
          ParamType.DataStruct,
        ),
        'parent': serializeParam(
          _parent,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FullStudentModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FullStudentModelStruct(
        student: deserializeStructParam(
          data['student'],
          ParamType.DataStruct,
          false,
          structBuilder: StudentModelStruct.fromSerializableMap,
        ),
        parent: deserializeStructParam(
          data['parent'],
          ParamType.DataStruct,
          false,
          structBuilder: ParentModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FullStudentModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FullStudentModelStruct &&
        student == other.student &&
        parent == other.parent;
  }

  @override
  int get hashCode => const ListEquality().hash([student, parent]);
}

FullStudentModelStruct createFullStudentModelStruct({
  StudentModelStruct? student,
  ParentModelStruct? parent,
}) =>
    FullStudentModelStruct(
      student: student ?? StudentModelStruct(),
      parent: parent ?? ParentModelStruct(),
    );
