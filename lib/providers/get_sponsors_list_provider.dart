import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final getSponsorsListProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'sponsors/',
          networkRequestType: NetworkRequestType.get,
          baseUrltype: BaseUrl.yolo)
      .whenComplete(
          () => ref.read(getSponsorsListStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
});

final getSponsorsListStatusProvider = StateProvider<bool>((ref) {
  return false;
});
