import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/data/local/shared_pref_helper.dart';
import 'package:yolo/data/remote/utils/endpoints.dart';

class Networking {
  static Future<String> post(url, body) async {
    Map<String, String> header = {
      'Authorization': "Bearer ${Prefs.authToken}",
      'Content-Type': 'application/json'
    };
    debugPrint(Endpoints.baseUrl + url);
    debugPrint(header.toString());
    debugPrint(body);

    final http.Response res = await http.post(
      Uri.parse(Endpoints.baseUrl + url),
      body: body,
      headers: header,
    );
    debugPrint(res.body);
    return res.body;
  }

  static Future<String> get(url) async {
    debugPrint(Endpoints.baseUrl + url);

    Map<String, String> header = {
      'Authorization': "Bearer ${Prefs.authToken}",
      'Content-Type': 'application/json'
    };
    debugPrint(header.toString());
    http.Response res = await http.get(
      Uri.parse(Endpoints.baseUrl + url),
      headers: header,
    );
    debugPrint(res.body);
    return res.body;
  }
}
