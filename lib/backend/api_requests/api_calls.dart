import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PaimentCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? userName = '',
    String? id = '',
    String? date = '',
    String? amount = '',
    String? ticketPrice = '',
    String? seatsNumber = '',
  }) async {
    const ffApiRequestBody = '''
{
  "sk-bf-38b833a0-1ab9-4584-8ebc-06aba46bf703": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Paiment',
      apiUrl:
          'https://api.backendflow.io/v1/email?templateId=a7h2wy1947OvFxbeQu4u&to=$to&subject=$subject&attachmentLink=$attachmentLink&attachmentName=$attachmentName&userName=$userName&id=$id&date=$date&seatsNumber=$seatsNumber&ticketPrice=$ticketPrice&amount=$amount',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WelcomeCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? attachmentLink = '',
    String? attachmentName = '',
    String? userName = '',
  }) async {
    const ffApiRequestBody = '''
{
  "sk-bf-38b833a0-1ab9-4584-8ebc-06aba46bf703": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Welcome',
      apiUrl:
          'https://api.backendflow.io/v1/email?templateId=WVcdS63HDGWDmTP3TyBC&to=$to&subject=$subject&attachmentLink=$attachmentLink&attachmentName=$attachmentName&userName=$userName',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

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
  if (item is DocumentReference) {
    return item.path;
  }
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

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
