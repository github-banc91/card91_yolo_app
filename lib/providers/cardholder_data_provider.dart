import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/data/remote/model/card_holder_data_model.dart';
import 'package:yolo/utils/constants.dart';
import 'package:yolo/utils/network_utils.dart';

final cardHolderDataProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/cardholder/details',
    networkRequestType: NetworkRequestType.post,
    body: requestBody,
    queryParameters: {"x-data-source": "test"},
    baseUrltype: BaseUrl.card91,
    protocolType: SSL.https,
  );
  print("response.body ${response.body}");
  print("response.statusCode ${response.statusCode}");
  List result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    ref.read(cardHolderProvider.notifier).state = result;
    print(
        "ref.read(cardHolderProvider.notifier).state ${ref.read(cardHolderProvider.notifier).state}");
  }

  return result;
});

final cardHolderProvider = StateProvider.autoDispose((ref) {
  return [];
});
