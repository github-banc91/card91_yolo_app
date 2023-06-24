import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final getAllSealsProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'deals/',
          networkRequestType: NetworkRequestType.get,
          baseUrltype: BaseUrl.yolo)
      .whenComplete(
          () => ref.read(getAllSealsStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
});

final getAllSealsStatusProvider = StateProvider<bool>((ref) {
  return false;
});
