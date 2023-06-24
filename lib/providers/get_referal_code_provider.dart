import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final getReferalCodeProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'referral/',
          networkRequestType: NetworkRequestType.get,
          baseUrltype: BaseUrl.yolo)
      .whenComplete(
          () => ref.read(getReferalCodeStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
});

final getReferalCodeStatusProvider = StateProvider<bool>((ref) {
  return false;
});
