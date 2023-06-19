import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final mobileloginProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint:
              'issuance/v1/cardholders/91${requestBody['mobile_number']}/mpin/status',
          networkRequestType: NetworkRequestType.get,
          baseUrltype: BaseUrl.user)
      .whenComplete(
          () => ref.read(mobileLoginStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    await Hive.box('db')
        .put('phoneNumber', "91${requestBody['mobile_number']}");
  }
  print(result);
  return result;
});

final mobileLoginStatusProvider = StateProvider<bool>((ref) {
  return false;
});
