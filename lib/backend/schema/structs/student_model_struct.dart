// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentModelStruct extends BaseStruct {
  StudentModelStruct({
    int? id,
    String? studentName,
    String? studentImage,
    int? parentId,
    String? pathStudentImage,
    ParentModelStruct? parent,
  })  : _id = id,
        _studentName = studentName,
        _studentImage = studentImage,
        _parentId = parentId,
        _pathStudentImage = pathStudentImage,
        _parent = parent;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "student_name" field.
  String? _studentName;
  String get studentName => _studentName ?? '';
  set studentName(String? val) => _studentName = val;
  bool hasStudentName() => _studentName != null;

  // "student_image" field.
  String? _studentImage;
  String get studentImage => _studentImage ?? '';
  set studentImage(String? val) => _studentImage = val;
  bool hasStudentImage() => _studentImage != null;

  // "parent_id" field.
  int? _parentId;
  int get parentId => _parentId ?? 0;
  set parentId(int? val) => _parentId = val;
  void incrementParentId(int amount) => _parentId = parentId + amount;
  bool hasParentId() => _parentId != null;

  // "path_student_image" field.
  String? _pathStudentImage;
  String get pathStudentImage => _pathStudentImage ?? '';
  set pathStudentImage(String? val) => _pathStudentImage = val;
  bool hasPathStudentImage() => _pathStudentImage != null;

  // "parent" field.
  ParentModelStruct? _parent;
  ParentModelStruct get parent => _parent ?? ParentModelStruct();
  set parent(ParentModelStruct? val) => _parent = val;
  void updateParent(Function(ParentModelStruct) updateFn) =>
      updateFn(_parent ??= ParentModelStruct());
  bool hasParent() => _parent != null;

  static StudentModelStruct fromMap(Map<String, dynamic> data) =>
      StudentModelStruct(
        id: castToType<int>(data['id']),
        studentName: data['student_name'] as String?,
        studentImage: data['student_image'] as String?,
        parentId: castToType<int>(data['parent_id']),
        pathStudentImage: data['path_student_image'] as String?,
        parent: ParentModelStruct.maybeFromMap(data['parent']),
      );

  static StudentModelStruct? maybeFromMap(dynamic data) => data is Map
      ? StudentModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'student_name': _studentName,
        'student_image': _studentImage,
        'parent_id': _parentId,
        'path_student_image': _pathStudentImage,
        'parent': _parent?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'student_name': serializeParam(
          _studentName,
          ParamType.String,
        ),
        'student_image': serializeParam(
          _studentImage,
          ParamType.String,
        ),
        'parent_id': serializeParam(
          _parentId,
          ParamType.int,
        ),
        'path_student_image': serializeParam(
          _pathStudentImage,
          ParamType.String,
        ),
        'parent': serializeParam(
          _parent,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static StudentModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      StudentModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        studentName: deserializeParam(
          data['student_name'],
          ParamType.String,
          false,
        ),
        studentImage: deserializeParam(
          data['student_image'],
          ParamType.String,
          false,
        ),
        parentId: deserializeParam(
          data['parent_id'],
          ParamType.int,
          false,
        ),
        pathStudentImage: deserializeParam(
          data['path_student_image'],
          ParamType.String,
          false,
        ),
        parent: deserializeStructParam(
          data['parent'],
          ParamType.DataStruct,
          false,
          structBuilder: ParentModelStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'StudentModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StudentModelStruct &&
        id == other.id &&
        studentName == other.studentName &&
        studentImage == other.studentImage &&
        parentId == other.parentId &&
        pathStudentImage == other.pathStudentImage &&
        parent == other.parent;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, studentName, studentImage, parentId, pathStudentImage, parent]);
}

StudentModelStruct createStudentModelStruct({
  int? id,
  String? studentName,
  String? studentImage,
  int? parentId,
  String? pathStudentImage,
  ParentModelStruct? parent,
}) =>
    StudentModelStruct(
      id: id,
      studentName: studentName,
      studentImage: studentImage,
      parentId: parentId,
      pathStudentImage: pathStudentImage,
      parent: parent ?? ParentModelStruct(),
    );
