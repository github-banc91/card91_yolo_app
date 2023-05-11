import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/data/remote/utils/endpoints.dart';

class Networking {
  static Future<String> post({url, body, bool isHeader = true}) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    debugPrint(Endpoints.baseUrl + url);
    debugPrint(header.toString());
    debugPrint(body);

    final http.Response res = await http.post(
      Uri.parse(Endpoints.baseUrl + url),
      body: body,
      headers: header,
    );
    // printShow(res.body);
    return res.body;
  }

  static Future<String> get({url, bool isHeader = false}) async {
    debugPrint(Endpoints.baseUrl + url);
    debugPrint('isheader $isHeader');

    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    debugPrint(header.toString());
    http.Response res = await http.get(
      Uri.parse(Endpoints.baseUrl + url),
      headers: header,
    );
    // printShow(res.body);
    return res.body;
  }
}
