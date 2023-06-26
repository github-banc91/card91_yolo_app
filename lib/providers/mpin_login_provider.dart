import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final mpinloginProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'issuance/v1/cardholders/login/mpin',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.user,
          body: requestBody,
          protocolType: SSL.https)
      .whenComplete(
          () => ref.read(mpinLoginStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    await Hive.box('db').put('name', result['customer']['name']);
    await Hive.box('db').put('mobile', result['customer']['mobile']);
  }
  return response;
});
final mpinLoginStatusProvider = StateProvider<bool>((ref) {
  return false;
});
