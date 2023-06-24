import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final accessKeyProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'vendor/login',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.yolo)
      .whenComplete(
          () => ref.read(accessKeyStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
});

final accessKeyStatusProvider = StateProvider<bool>((ref) {
  return false;
});
