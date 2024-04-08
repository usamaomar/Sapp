// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TokenModelStruct extends BaseStruct {
  TokenModelStruct({
    String? token,
  }) : _token = token;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;
  bool hasToken() => _token != null;

  static TokenModelStruct fromMap(Map<String, dynamic> data) =>
      TokenModelStruct(
        token: data['token'] as String?,
      );

  static TokenModelStruct? maybeFromMap(dynamic data) => data is Map
      ? TokenModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
      }.withoutNulls;

  static TokenModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokenModelStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TokenModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokenModelStruct && token == other.token;
  }

  @override
  int get hashCode => const ListEquality().hash([token]);
}

TokenModelStruct createTokenModelStruct({
  String? token,
}) =>
    TokenModelStruct(
      token: token,
    );
