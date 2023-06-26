import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

// Enum for the type of network request
enum NetworkRequestType {
  get,
  post,
}

enum BaseUrl {
  user,
  yolo,
  yolo1,
  yolo2,
}

enum SSL {
  http,
  https,
}

Map<String, dynamic> requestBody = {};

// Utility class for making network requests
class NetworkUtils {
  NetworkUtils._();

  // Static function for making network requests
  static Future<http.Response> request({
    required String endpoint,
    required NetworkRequestType networkRequestType,
    required BaseUrl baseUrltype,
    required SSL protocolType,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    String baseUrl;
    Uri uri;
    switch (baseUrltype) {
      case BaseUrl.user:
        baseUrl = 'api.sb.stag.card91.in';
        break;
      case BaseUrl.yolo:
        baseUrl = '16.170.11.174:8080';
        break;
      case BaseUrl.yolo1:
        baseUrl = '16.170.11.174:2020';
        break;
      case BaseUrl.yolo2:
        baseUrl = '16.170.11.174:4040';
        break;
    }
    switch (protocolType) {
      case SSL.http:
        uri = Uri.http(baseUrl, endpoint, {}..addAll(queryParameters ?? {}));
        break;
      case SSL.https:
        uri = Uri.https(baseUrl, endpoint, {}..addAll(queryParameters ?? {}));
        break;
    }
    switch (networkRequestType) {
      case NetworkRequestType.get:
        print(uri);
        print(headers);
        final response = await http.get(
          uri,
          headers: {}..addAll(
              headers ?? {},
            ),
        );
        return response;
      case NetworkRequestType.post:
        final response = await http.post(uri,
            headers: {
              'Content-Type': 'application/json',
            }..addAll(
                headers ?? {},
              ),
            body: jsonEncode({}..addAll(body ?? {})));
        return response;
    }
  }
}
