import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start StrackerApis Group Code

class StrackerApisGroup {
  static String getBaseUrl({
    String? authorization = '',
  }) =>
      'https://sts.attendious.com/api';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer [Authorization]',
  };
  static LoginApiCall loginApiCall = LoginApiCall();
  static GetStudentApiCall getStudentApiCall = GetStudentApiCall();
  static EndTripApiCall endTripApiCall = EndTripApiCall();
  static UpdateStudentStatusApiCall updateStudentStatusApiCall =
      UpdateStudentStatusApiCall();
  static UpdateLiveLocationCall updateLiveLocationCall =
      UpdateLiveLocationCall();
  static NewStudentApiCall newStudentApiCall = NewStudentApiCall();
  static MyStudentsApiCall myStudentsApiCall = MyStudentsApiCall();
  static GetBranchesApiCall getBranchesApiCall = GetBranchesApiCall();
  static GetMyNotificationsCall getMyNotificationsCall =
      GetMyNotificationsCall();
  static GetCurrentTripApiCall getCurrentTripApiCall = GetCurrentTripApiCall();
}

class LoginApiCall {
  Future<ApiCallResponse> call({
    String? mobileNumber = '',
    String? password = '',
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    final ffApiRequestBody = '''
{
  "mobile_number": "$mobileNumber",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: '$baseUrl/login',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic userbject(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? tokenObject(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class GetStudentApiCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getStudentApi',
      apiUrl: '$baseUrl/getStudent',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EndTripApiCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'endTripApi',
      apiUrl: '$baseUrl/tripEnd',
      callType: ApiCallType.PUT,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateStudentStatusApiCall {
  Future<ApiCallResponse> call({
    String? studentId = '',
    String? status = '',
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    final ffApiRequestBody = '''
{
  "student_id": "$studentId",
  "status": "$status"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateStudentStatusApi',
      apiUrl: '$baseUrl/updateStudentStatus',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateLiveLocationCall {
  Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    final ffApiRequestBody = '''
{
  "lat": "$lat",
  "lng": "$lng"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateLiveLocation',
      apiUrl: '$baseUrl/updateLiveLocation',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class NewStudentApiCall {
  Future<ApiCallResponse> call({
    String? studentName = '',
    FFUploadedFile? studentImage,
    int? branchId,
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'NewStudentApi',
      apiUrl: '$baseUrl/myStudents/store',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {
        'branch_id': branchId,
        'student_name': studentName,
        'student_image': studentImage,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class MyStudentsApiCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'MyStudentsApi',
      apiUrl: '$baseUrl/myStudents',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBranchesApiCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetBranches Api',
      apiUrl: '$baseUrl/getBranches',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetMyNotificationsCall {
  Future<ApiCallResponse> call({
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetMyNotifications',
      apiUrl: '$baseUrl/myNotifications',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCurrentTripApiCall {
  Future<ApiCallResponse> call({
    int? id,
    String? authorization = '',
  }) async {
    final baseUrl = StrackerApisGroup.getBaseUrl(
      authorization: authorization,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetCurrentTripApi',
      apiUrl: '$baseUrl/trip/current/$id',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authorization',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End StrackerApis Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
