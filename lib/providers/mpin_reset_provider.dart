import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yolo/utils/network_utils.dart';

final resetMpinProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'issuance/v1/cardholders/mpin/verify',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.user,
          body: requestBody,
          protocolType: SSL.https)
      .whenComplete(() =>
          ref.read(resetMpinProviderStatusProvider.notifier).state = false);
  return response;
});

final resetMpinProviderStatusProvider = StateProvider<bool>((ref) {
  return false;
});
