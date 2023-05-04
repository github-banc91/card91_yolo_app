import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/data/remote/utils/endpoints.dart';

class Networking {
  static Future<String> post({url, body, bool isHeader = true}) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    debugPrint(Endpoints.baseURL + url);
    debugPrint(header.toString());
    debugPrint(body);

    final http.Response res = await http.post(
      Uri.parse(Endpoints.baseURL + url),
      body: body,
      headers: header,
    );
    printShow(res.body);
    return res.body;
  }

  static Future<String> get({url, bool isHeader = false}) async {
    debugPrint(Endpoints.baseURL + url);
    debugPrint('isheader $isHeader');

    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    debugPrint(header.toString());
    http.Response res = await http.get(
      Uri.parse(Endpoints.baseURL + url),
      headers: header,
    );
    printShow(res.body);
    return res.body;
  }
}

///calls POST api and returns json decoded http.Response
dynamic _callPostApi(
  final String path,
  final Map<String, dynamic> requestBody, [
  final String? baseUrl,
]) async {
  //common headers
  final Map<String, String> header = {
    'Authorization': "Bearer ${SharedPrefHelper.authToken}",
    'Content-Type': 'application/json'
  };

  //creating the REST Endpoint Url
  final baseUrlNonNull = baseUrl ?? Endpoints.baseURL;
  final completeUrl = "$baseUrlNonNull/$path";

  //calling the REST API
  /* final http.Response res = await client.post(
    Uri.parse(completeUrl),
    body: jsonEncode(requestBody),
    headers: header,
  );

  return jsonDecode(res.body);*/
}

///calls GET api and returns json decoded http.Response
dynamic _callGetApi(
  final String path,
  final Map<String, String> queryParams, [
  final String? url,
]) async {
  //common headers
  final Map<String, String> header = {
    'Authorization': "Bearer ${SharedPrefHelper.authToken}",
    'Content-Type': 'application/json'
  };

  //creating the REST Endpoint Url
  final uri = Uri.parse(Endpoints.baseURL + path);

  //calling the REST API
  final http.Response res = await http.get(
    uri,
    headers: header,
  );
  print(res.body);
  return jsonDecode(res.body);
}
