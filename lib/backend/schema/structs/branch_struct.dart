// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BranchStruct extends BaseStruct {
  BranchStruct({
    int? id,
    String? name,
    String? lat,
    String? lng,
    String? branchPhoto,
    String? createdAt,
    String? updatedAt,
    bool? isSelected,
  })  : _id = id,
        _name = name,
        _lat = lat,
        _lng = lng,
        _branchPhoto = branchPhoto,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _isSelected = isSelected;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;
  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  set lng(String? val) => _lng = val;
  bool hasLng() => _lng != null;

  // "branch_photo" field.
  String? _branchPhoto;
  String get branchPhoto => _branchPhoto ?? '';
  set branchPhoto(String? val) => _branchPhoto = val;
  bool hasBranchPhoto() => _branchPhoto != null;

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

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  static BranchStruct fromMap(Map<String, dynamic> data) => BranchStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
        branchPhoto: data['branch_photo'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        isSelected: data['isSelected'] as bool?,
      );

  static BranchStruct? maybeFromMap(dynamic data) =>
      data is Map ? BranchStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'lat': _lat,
        'lng': _lng,
        'branch_photo': _branchPhoto,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'isSelected': _isSelected,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.String,
        ),
        'branch_photo': serializeParam(
          _branchPhoto,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
      }.withoutNulls;

  static BranchStruct fromSerializableMap(Map<String, dynamic> data) =>
      BranchStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.String,
          false,
        ),
        branchPhoto: deserializeParam(
          data['branch_photo'],
          ParamType.String,
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
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'BranchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BranchStruct &&
        id == other.id &&
        name == other.name &&
        lat == other.lat &&
        lng == other.lng &&
        branchPhoto == other.branchPhoto &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        isSelected == other.isSelected;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, name, lat, lng, branchPhoto, createdAt, updatedAt, isSelected]);
}

BranchStruct createBranchStruct({
  int? id,
  String? name,
  String? lat,
  String? lng,
  String? branchPhoto,
  String? createdAt,
  String? updatedAt,
  bool? isSelected,
}) =>
    BranchStruct(
      id: id,
      name: name,
      lat: lat,
      lng: lng,
      branchPhoto: branchPhoto,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isSelected: isSelected,
    );
