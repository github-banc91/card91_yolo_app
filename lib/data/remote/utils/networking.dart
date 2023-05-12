import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/data/remote/utils/endpoints.dart';

class Networking {
  static Future post(url, body) async {
    Map<String, String> header = {
      'Authorization':
          "Bearer CARD9117f292ee4642e6cf504e543fabf92ba99d261cd70b12d567f1a045e0e558a0e7560ef6b9cc11712682b5e54ad6dcd46191c7b63c7e89e819a371191ca52743d8",
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
    return res;
  }

  static Future get(url) async {
    debugPrint(Endpoints.baseUrl + url);

    Map<String, String> header = {
      'Authorization':
          "Bearer CARD9117f292ee4642e6cf504e543fabf92ba99d261cd70b12d567f1a045e0e558a0e7560ef6b9cc11712682b5e54ad6dcd46191c7b63c7e89e819a371191ca52743d8",
      'Content-Type': 'application/json'
    };
    debugPrint(header.toString());
    http.Response res = await http.get(
      Uri.parse(Endpoints.baseUrl + url),
      headers: header,
    );
    debugPrint(res.body);
    return res;
  }
}
