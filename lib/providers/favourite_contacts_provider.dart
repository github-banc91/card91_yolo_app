import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final favouriteContactsProvider = FutureProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/favourites/get',
    networkRequestType: NetworkRequestType.post,
    body: {
      "mobile": Hive.box('db').get('phoneNumber'),
      "card_id": Hive.box('db').get('cardId')
    },
    queryParameters: {"x-data-source": "test"},
    baseUrltype: BaseUrl.user,
    protocolType: SSL.https,
  );
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
});
