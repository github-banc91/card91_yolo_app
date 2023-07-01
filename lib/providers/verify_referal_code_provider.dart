import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final verifyReferalCodeProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: '/api/v1/referral/verify',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.yolo2,
          body: requestBody,
          protocolType: SSL.http)
      .whenComplete(() => ref
          .read(verifyReferalCodeProviderStatusProvider.notifier)
          .state = false);
  // Map<String, dynamic> result = jsonDecode(response.body);
  return response;
});

final verifyReferalCodeProviderStatusProvider = StateProvider<bool>((ref) {
  return false;
});
