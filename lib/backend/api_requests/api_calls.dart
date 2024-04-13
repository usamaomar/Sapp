import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start StrackerApis Group Code

class StrackerApisGroup {
  static String baseUrl = 'https://sts.attendious.com/api';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer [Authorization]',
  };
  static LoginApiCall loginApiCall = LoginApiCall();
  static GetStudentApiCall getStudentApiCall = GetStudentApiCall();
}

class LoginApiCall {
  Future<ApiCallResponse> call({
    String? mobileNumber = '',
    String? password = '',
    String? authorization = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mobile_number": "$mobileNumber",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LoginApi',
      apiUrl: '${StrackerApisGroup.baseUrl}/login',
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
    String? authorization = '',String goBack = 'go'
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getStudentApi',
      apiUrl: '${StrackerApisGroup.baseUrl}/getStudent/$goBack',
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
