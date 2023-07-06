import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network.dart';

final accessKeyProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
      endpoint: '/api/v1/vendor/login',
      networkRequestType: NetworkRequestType.post,
      baseUrltype: BaseUrl.yolo,
      body: requestBody,
      headers: {
        'Content-Type': 'application/json',
      },
      protocolType: SSL.http);

  Map<String, dynamic> result = jsonDecode(response.body);
  print("accessKeyProvider - ${response.body}");
  if (response.statusCode == 200) {
    await Hive.box('db').put('accessKey', result['accessKey']);
  }
});
