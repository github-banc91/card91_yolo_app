import 'dart:convert';

import 'package:http/http.dart' as http;

// Enum for the type of network request
enum NetworkRequestType {
  get,
  post,
}

enum BaseUrl {
  user,
  yolo,
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
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    String? baseUrl;
    switch (baseUrltype) {
      case BaseUrl.user:
        baseUrl = 'api.sb.stag.card91.in';
        break;
      case BaseUrl.yolo:
        baseUrl = '16.170.11.174:8080';
        break;
    }
    switch (networkRequestType) {
      case NetworkRequestType.get:
        // Make a GET request with the specified parameters
        final response = await http.get(
          Uri.https(baseUrl, endpoint, {}..addAll(queryParameters ?? {})),
          headers: {}..addAll(
              headers ?? {},
            ),
        );
        return response;
      case NetworkRequestType.post:
        // Make a POST request with the specified parameters
        print("url - ${Uri.http(
          baseUrl,
          endpoint,
        )}");
        print("requestbody - ${jsonEncode({}..addAll(body ?? {}))}");
        final response = await http.post(
            Uri.http(baseUrl, endpoint, {}..addAll(queryParameters ?? {})),
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
