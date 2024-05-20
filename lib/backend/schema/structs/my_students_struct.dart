// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyStudentsStruct extends BaseStruct {
  MyStudentsStruct({
    int? id,
    String? studentName,
    String? studentImage,
    double? distance,
    int? parentId,
    int? branchId,
    String? createdAt,
    String? updatedAt,
    String? pathStudentImage,
    String? branchName,
    BranchStruct? branch,
  })  : _id = id,
        _studentName = studentName,
        _studentImage = studentImage,
        _distance = distance,
        _parentId = parentId,
        _branchId = branchId,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _pathStudentImage = pathStudentImage,
        _branchName = branchName,
        _branch = branch;

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

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  set distance(double? val) => _distance = val;
  void incrementDistance(double amount) => _distance = distance + amount;
  bool hasDistance() => _distance != null;

  // "parent_id" field.
  int? _parentId;
  int get parentId => _parentId ?? 0;
  set parentId(int? val) => _parentId = val;
  void incrementParentId(int amount) => _parentId = parentId + amount;
  bool hasParentId() => _parentId != null;

  // "branch_id" field.
  int? _branchId;
  int get branchId => _branchId ?? 0;
  set branchId(int? val) => _branchId = val;
  void incrementBranchId(int amount) => _branchId = branchId + amount;
  bool hasBranchId() => _branchId != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "path_student_image" field.
  String? _pathStudentImage;
  String get pathStudentImage => _pathStudentImage ?? '';
  set pathStudentImage(String? val) => _pathStudentImage = val;
  bool hasPathStudentImage() => _pathStudentImage != null;

  // "branch_name" field.
  String? _branchName;
  String get branchName => _branchName ?? '';
  set branchName(String? val) => _branchName = val;
  bool hasBranchName() => _branchName != null;

  // "branch" field.
  BranchStruct? _branch;
  BranchStruct get branch => _branch ?? BranchStruct();
  set branch(BranchStruct? val) => _branch = val;
  void updateBranch(Function(BranchStruct) updateFn) =>
      updateFn(_branch ??= BranchStruct());
  bool hasBranch() => _branch != null;

  static MyStudentsStruct fromMap(Map<String, dynamic> data) =>
      MyStudentsStruct(
        id: castToType<int>(data['id']),
        studentName: data['student_name'] as String?,
        studentImage: data['student_image'] as String?,
        distance: castToType<double>(data['distance']),
        parentId: castToType<int>(data['parent_id']),
        branchId: castToType<int>(data['branch_id']),
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        pathStudentImage: data['path_student_image'] as String?,
        branchName: data['branch_name'] as String?,
        branch: BranchStruct.maybeFromMap(data['branch']),
      );

  static MyStudentsStruct? maybeFromMap(dynamic data) => data is Map
      ? MyStudentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'student_name': _studentName,
        'student_image': _studentImage,
        'distance': _distance,
        'parent_id': _parentId,
        'branch_id': _branchId,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'path_student_image': _pathStudentImage,
        'branch_name': _branchName,
        'branch': _branch?.toMap(),
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
        'distance': serializeParam(
          _distance,
          ParamType.double,
        ),
        'parent_id': serializeParam(
          _parentId,
          ParamType.int,
        ),
        'branch_id': serializeParam(
          _branchId,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'path_student_image': serializeParam(
          _pathStudentImage,
          ParamType.String,
        ),
        'branch_name': serializeParam(
          _branchName,
          ParamType.String,
        ),
        'branch': serializeParam(
          _branch,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static MyStudentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      MyStudentsStruct(
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
        distance: deserializeParam(
          data['distance'],
          ParamType.double,
          false,
        ),
        parentId: deserializeParam(
          data['parent_id'],
          ParamType.int,
          false,
        ),
        branchId: deserializeParam(
          data['branch_id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        pathStudentImage: deserializeParam(
          data['path_student_image'],
          ParamType.String,
          false,
        ),
        branchName: deserializeParam(
          data['branch_name'],
          ParamType.String,
          false,
        ),
        branch: deserializeStructParam(
          data['branch'],
          ParamType.DataStruct,
          false,
          structBuilder: BranchStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'MyStudentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MyStudentsStruct &&
        id == other.id &&
        studentName == other.studentName &&
        studentImage == other.studentImage &&
        distance == other.distance &&
        parentId == other.parentId &&
        branchId == other.branchId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        pathStudentImage == other.pathStudentImage &&
        branchName == other.branchName &&
        branch == other.branch;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        studentName,
        studentImage,
        distance,
        parentId,
        branchId,
        createdAt,
        updatedAt,
        pathStudentImage,
        branchName,
        branch
      ]);
}

MyStudentsStruct createMyStudentsStruct({
  int? id,
  String? studentName,
  String? studentImage,
  double? distance,
  int? parentId,
  int? branchId,
  String? createdAt,
  String? updatedAt,
  String? pathStudentImage,
  String? branchName,
  BranchStruct? branch,
}) =>
    MyStudentsStruct(
      id: id,
      studentName: studentName,
      studentImage: studentImage,
      distance: distance,
      parentId: parentId,
      branchId: branchId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      pathStudentImage: pathStudentImage,
      branchName: branchName,
      branch: branch ?? BranchStruct(),
    );
