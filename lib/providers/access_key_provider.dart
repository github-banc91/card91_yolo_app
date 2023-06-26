import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final accessKeyProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: '/api/v1/vendor/login',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.yolo,
          body: requestBody,
          protocolType: SSL.http)
      .whenComplete(() =>
          ref.read(accessKeyProviderStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  print("accessKey - $result");
  if (response.statusCode == 200) {
    await Hive.box('db').put('accessKey', result['accessKey']);
  }
});

final accessKeyProviderStatusProvider = StateProvider<bool>((ref) {
  return false;
});
