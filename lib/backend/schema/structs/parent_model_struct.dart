// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParentModelStruct extends BaseStruct {
  ParentModelStruct({
    int? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? twoFactorConfirmedAt,
    String? nationality,
    int? idNumber,
    String? address,
    String? mobileNumber,
    String? mobileNumberCountry,
    String? lat,
    String? lng,
    String? distance,
    String? dateOfBirth,
    int? currentTeamId,
    String? profilePhotoPath,
    String? anotherParentImage,
    String? anotherParentName,
    String? profilePhotoUrl,
    String? pathUserImage,
    String? pathAnotherParentImage,
  })  : _id = id,
        _name = name,
        _email = email,
        _emailVerifiedAt = emailVerifiedAt,
        _twoFactorConfirmedAt = twoFactorConfirmedAt,
        _nationality = nationality,
        _idNumber = idNumber,
        _address = address,
        _mobileNumber = mobileNumber,
        _mobileNumberCountry = mobileNumberCountry,
        _lat = lat,
        _lng = lng,
        _distance = distance,
        _dateOfBirth = dateOfBirth,
        _currentTeamId = currentTeamId,
        _profilePhotoPath = profilePhotoPath,
        _anotherParentImage = anotherParentImage,
        _anotherParentName = anotherParentName,
        _profilePhotoUrl = profilePhotoUrl,
        _pathUserImage = pathUserImage,
        _pathAnotherParentImage = pathAnotherParentImage;

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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "email_verified_at" field.
  String? _emailVerifiedAt;
  String get emailVerifiedAt => _emailVerifiedAt ?? '';
  set emailVerifiedAt(String? val) => _emailVerifiedAt = val;
  bool hasEmailVerifiedAt() => _emailVerifiedAt != null;

  // "two_factor_confirmed_at" field.
  String? _twoFactorConfirmedAt;
  String get twoFactorConfirmedAt => _twoFactorConfirmedAt ?? '';
  set twoFactorConfirmedAt(String? val) => _twoFactorConfirmedAt = val;
  bool hasTwoFactorConfirmedAt() => _twoFactorConfirmedAt != null;

  // "nationality" field.
  String? _nationality;
  String get nationality => _nationality ?? '';
  set nationality(String? val) => _nationality = val;
  bool hasNationality() => _nationality != null;

  // "id_number" field.
  int? _idNumber;
  int get idNumber => _idNumber ?? 0;
  set idNumber(int? val) => _idNumber = val;
  void incrementIdNumber(int amount) => _idNumber = idNumber + amount;
  bool hasIdNumber() => _idNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "mobile_number" field.
  String? _mobileNumber;
  String get mobileNumber => _mobileNumber ?? '';
  set mobileNumber(String? val) => _mobileNumber = val;
  bool hasMobileNumber() => _mobileNumber != null;

  // "mobile_number_country" field.
  String? _mobileNumberCountry;
  String get mobileNumberCountry => _mobileNumberCountry ?? '';
  set mobileNumberCountry(String? val) => _mobileNumberCountry = val;
  bool hasMobileNumberCountry() => _mobileNumberCountry != null;

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

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  set distance(String? val) => _distance = val;
  bool hasDistance() => _distance != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "current_team_id" field.
  int? _currentTeamId;
  int get currentTeamId => _currentTeamId ?? 0;
  set currentTeamId(int? val) => _currentTeamId = val;
  void incrementCurrentTeamId(int amount) =>
      _currentTeamId = currentTeamId + amount;
  bool hasCurrentTeamId() => _currentTeamId != null;

  // "profile_photo_path" field.
  String? _profilePhotoPath;
  String get profilePhotoPath => _profilePhotoPath ?? '';
  set profilePhotoPath(String? val) => _profilePhotoPath = val;
  bool hasProfilePhotoPath() => _profilePhotoPath != null;

  // "another_parent_image" field.
  String? _anotherParentImage;
  String get anotherParentImage => _anotherParentImage ?? '';
  set anotherParentImage(String? val) => _anotherParentImage = val;
  bool hasAnotherParentImage() => _anotherParentImage != null;

  // "another_parent_name" field.
  String? _anotherParentName;
  String get anotherParentName => _anotherParentName ?? '';
  set anotherParentName(String? val) => _anotherParentName = val;
  bool hasAnotherParentName() => _anotherParentName != null;

  // "profile_photo_url" field.
  String? _profilePhotoUrl;
  String get profilePhotoUrl => _profilePhotoUrl ?? '';
  set profilePhotoUrl(String? val) => _profilePhotoUrl = val;
  bool hasProfilePhotoUrl() => _profilePhotoUrl != null;

  // "path_user_image" field.
  String? _pathUserImage;
  String get pathUserImage => _pathUserImage ?? '';
  set pathUserImage(String? val) => _pathUserImage = val;
  bool hasPathUserImage() => _pathUserImage != null;

  // "path_another_parent_image" field.
  String? _pathAnotherParentImage;
  String get pathAnotherParentImage => _pathAnotherParentImage ?? '';
  set pathAnotherParentImage(String? val) => _pathAnotherParentImage = val;
  bool hasPathAnotherParentImage() => _pathAnotherParentImage != null;

  static ParentModelStruct fromMap(Map<String, dynamic> data) =>
      ParentModelStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        emailVerifiedAt: data['email_verified_at'] as String?,
        twoFactorConfirmedAt: data['two_factor_confirmed_at'] as String?,
        nationality: data['nationality'] as String?,
        idNumber: castToType<int>(data['id_number']),
        address: data['address'] as String?,
        mobileNumber: data['mobile_number'] as String?,
        mobileNumberCountry: data['mobile_number_country'] as String?,
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
        distance: data['distance'] as String?,
        dateOfBirth: data['date_of_birth'] as String?,
        currentTeamId: castToType<int>(data['current_team_id']),
        profilePhotoPath: data['profile_photo_path'] as String?,
        anotherParentImage: data['another_parent_image'] as String?,
        anotherParentName: data['another_parent_name'] as String?,
        profilePhotoUrl: data['profile_photo_url'] as String?,
        pathUserImage: data['path_user_image'] as String?,
        pathAnotherParentImage: data['path_another_parent_image'] as String?,
      );

  static ParentModelStruct? maybeFromMap(dynamic data) => data is Map
      ? ParentModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'email': _email,
        'email_verified_at': _emailVerifiedAt,
        'two_factor_confirmed_at': _twoFactorConfirmedAt,
        'nationality': _nationality,
        'id_number': _idNumber,
        'address': _address,
        'mobile_number': _mobileNumber,
        'mobile_number_country': _mobileNumberCountry,
        'lat': _lat,
        'lng': _lng,
        'distance': _distance,
        'date_of_birth': _dateOfBirth,
        'current_team_id': _currentTeamId,
        'profile_photo_path': _profilePhotoPath,
        'another_parent_image': _anotherParentImage,
        'another_parent_name': _anotherParentName,
        'profile_photo_url': _profilePhotoUrl,
        'path_user_image': _pathUserImage,
        'path_another_parent_image': _pathAnotherParentImage,
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
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'email_verified_at': serializeParam(
          _emailVerifiedAt,
          ParamType.String,
        ),
        'two_factor_confirmed_at': serializeParam(
          _twoFactorConfirmedAt,
          ParamType.String,
        ),
        'nationality': serializeParam(
          _nationality,
          ParamType.String,
        ),
        'id_number': serializeParam(
          _idNumber,
          ParamType.int,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'mobile_number': serializeParam(
          _mobileNumber,
          ParamType.String,
        ),
        'mobile_number_country': serializeParam(
          _mobileNumberCountry,
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
        'distance': serializeParam(
          _distance,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'current_team_id': serializeParam(
          _currentTeamId,
          ParamType.int,
        ),
        'profile_photo_path': serializeParam(
          _profilePhotoPath,
          ParamType.String,
        ),
        'another_parent_image': serializeParam(
          _anotherParentImage,
          ParamType.String,
        ),
        'another_parent_name': serializeParam(
          _anotherParentName,
          ParamType.String,
        ),
        'profile_photo_url': serializeParam(
          _profilePhotoUrl,
          ParamType.String,
        ),
        'path_user_image': serializeParam(
          _pathUserImage,
          ParamType.String,
        ),
        'path_another_parent_image': serializeParam(
          _pathAnotherParentImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ParentModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParentModelStruct(
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
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        emailVerifiedAt: deserializeParam(
          data['email_verified_at'],
          ParamType.String,
          false,
        ),
        twoFactorConfirmedAt: deserializeParam(
          data['two_factor_confirmed_at'],
          ParamType.String,
          false,
        ),
        nationality: deserializeParam(
          data['nationality'],
          ParamType.String,
          false,
        ),
        idNumber: deserializeParam(
          data['id_number'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        mobileNumber: deserializeParam(
          data['mobile_number'],
          ParamType.String,
          false,
        ),
        mobileNumberCountry: deserializeParam(
          data['mobile_number_country'],
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
        distance: deserializeParam(
          data['distance'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        currentTeamId: deserializeParam(
          data['current_team_id'],
          ParamType.int,
          false,
        ),
        profilePhotoPath: deserializeParam(
          data['profile_photo_path'],
          ParamType.String,
          false,
        ),
        anotherParentImage: deserializeParam(
          data['another_parent_image'],
          ParamType.String,
          false,
        ),
        anotherParentName: deserializeParam(
          data['another_parent_name'],
          ParamType.String,
          false,
        ),
        profilePhotoUrl: deserializeParam(
          data['profile_photo_url'],
          ParamType.String,
          false,
        ),
        pathUserImage: deserializeParam(
          data['path_user_image'],
          ParamType.String,
          false,
        ),
        pathAnotherParentImage: deserializeParam(
          data['path_another_parent_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ParentModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParentModelStruct &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        emailVerifiedAt == other.emailVerifiedAt &&
        twoFactorConfirmedAt == other.twoFactorConfirmedAt &&
        nationality == other.nationality &&
        idNumber == other.idNumber &&
        address == other.address &&
        mobileNumber == other.mobileNumber &&
        mobileNumberCountry == other.mobileNumberCountry &&
        lat == other.lat &&
        lng == other.lng &&
        distance == other.distance &&
        dateOfBirth == other.dateOfBirth &&
        currentTeamId == other.currentTeamId &&
        profilePhotoPath == other.profilePhotoPath &&
        anotherParentImage == other.anotherParentImage &&
        anotherParentName == other.anotherParentName &&
        profilePhotoUrl == other.profilePhotoUrl &&
        pathUserImage == other.pathUserImage &&
        pathAnotherParentImage == other.pathAnotherParentImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        email,
        emailVerifiedAt,
        twoFactorConfirmedAt,
        nationality,
        idNumber,
        address,
        mobileNumber,
        mobileNumberCountry,
        lat,
        lng,
        distance,
        dateOfBirth,
        currentTeamId,
        profilePhotoPath,
        anotherParentImage,
        anotherParentName,
        profilePhotoUrl,
        pathUserImage,
        pathAnotherParentImage
      ]);
}

ParentModelStruct createParentModelStruct({
  int? id,
  String? name,
  String? email,
  String? emailVerifiedAt,
  String? twoFactorConfirmedAt,
  String? nationality,
  int? idNumber,
  String? address,
  String? mobileNumber,
  String? mobileNumberCountry,
  String? lat,
  String? lng,
  String? distance,
  String? dateOfBirth,
  int? currentTeamId,
  String? profilePhotoPath,
  String? anotherParentImage,
  String? anotherParentName,
  String? profilePhotoUrl,
  String? pathUserImage,
  String? pathAnotherParentImage,
}) =>
    ParentModelStruct(
      id: id,
      name: name,
      email: email,
      emailVerifiedAt: emailVerifiedAt,
      twoFactorConfirmedAt: twoFactorConfirmedAt,
      nationality: nationality,
      idNumber: idNumber,
      address: address,
      mobileNumber: mobileNumber,
      mobileNumberCountry: mobileNumberCountry,
      lat: lat,
      lng: lng,
      distance: distance,
      dateOfBirth: dateOfBirth,
      currentTeamId: currentTeamId,
      profilePhotoPath: profilePhotoPath,
      anotherParentImage: anotherParentImage,
      anotherParentName: anotherParentName,
      profilePhotoUrl: profilePhotoUrl,
      pathUserImage: pathUserImage,
      pathAnotherParentImage: pathAnotherParentImage,
    );
