import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final getReferalCodeProvider = FutureProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
      endpoint: '/api/v1/referral/',
      networkRequestType: NetworkRequestType.get,
      baseUrltype: BaseUrl.yolo2,
      protocolType: SSL.http,
      headers: {
        'Authorization': Hive.box('db').get('accessKey') ?? '',
      });

  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
});
