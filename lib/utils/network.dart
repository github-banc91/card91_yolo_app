import 'dart:convert';
import 'package:http/http.dart' as http;

enum NetworkRequestType {
  get,
  post,
}

enum BaseUrl {
  user,
  yolo,
  yolo1,
  yolo2,
  card91,
}

enum SSL {
  http,
  https,
}

Map<String, dynamic> requestBody = {};

class NetworkUtils {
  NetworkUtils._();

  static Future<http.Response> request({
    required String endpoint,
    required NetworkRequestType networkRequestType,
    required BaseUrl baseUrltype,
    required SSL protocolType,
    required Map<String, String> headers,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    String baseUrl;
    Uri uri;
    switch (baseUrltype) {
      case BaseUrl.user:
        baseUrl = 'api-sandbox.card91.io';
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
      case BaseUrl.card91:
        baseUrl = 'integrations.card91.io';
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
        final response = await http.get(uri, headers: headers);
        return response;
      case NetworkRequestType.post:
        final response =
            await http.post(uri, headers: headers, body: jsonEncode(body));
        return response;
    }
  }
}
