import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final favouriteContactsProvider = FutureProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
    endpoint: 'api:Srfx-bxR/contact/favourites/get',
    networkRequestType: NetworkRequestType.post,
    body: requestBody,
    queryParameters: {"x-data-source": "test"},
    baseUrltype: BaseUrl.card91,
    protocolType: SSL.https,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': Hive.box('db').get('jwt')
    },
  );
  print('result ${response.body}');
  print('statuscode ${response.statusCode}');

  List<dynamic> result = jsonDecode(response.body);
  return result;
});
