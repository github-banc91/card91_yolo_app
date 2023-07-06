import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network.dart';

final cardHolderDataProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/cardholder/details',
    networkRequestType: NetworkRequestType.post,
    body: requestBody,
    queryParameters: {"x-data-source": "test"},
    headers: {
      'Content-Type': 'application/json',
    },
    baseUrltype: BaseUrl.card91,
    protocolType: SSL.https,
  ).whenComplete(() => ref.read(cardHolderLoader.notifier).state = false);
  print('response.body - ${response.body}');
  List result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    ref.read(cardHolderProvider.notifier).state = result;
  }
  return result;
});

final cardHolderProvider = StateProvider.autoDispose((ref) {
  return [];
});

final cardHolderLoader = StateProvider.autoDispose<bool>((ref) {
  return false;
});
