import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final getSponsorsListProvider = FutureProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
      endpoint: '/api/v1/sponsors/',
      networkRequestType: NetworkRequestType.get,
      baseUrltype: BaseUrl.yolo1,
      protocolType: SSL.http,
      headers: {'Authorization': Hive.box('db').get('accessKey') ?? ''});
  Map<String, dynamic> result = jsonDecode(response.body);
  print("result - ${result}");
  return result;
});
