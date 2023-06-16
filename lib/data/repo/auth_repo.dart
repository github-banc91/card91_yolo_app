import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yolo/data/remote/utils/endpoints.dart';
import 'package:yolo/data/remote/utils/networking.dart';
import 'package:yolo/data/repo/response_data.dart';

class RequestRepo {
  static Future loginCall(String mobile) async {
    //making the api call
    Map<String, String> body = {
      "mobile": mobile,
    };
    final response = await Networking.post(
      Endpoints.mpinLoginUrl,
      jsonEncode(body),
    );

    final responseJson = jsonDecode(response);
    final bool loginSucceeded = responseJson['status'] == 'true' ? true : false;
    final String message = responseJson['message'];

    return Response(response.status, responseJson);
  }

  static Future<Response> otpVerifyCall(String otp) async {
    //making the api call
    final http.Response response = await Networking.post(
      Endpoints.authority,
      jsonEncode({'otp': otp}),
    );
    //parsing json data
    final responseJson = jsonDecode(response.body);
    final bool loginSucceeded = responseJson['status'] == 'true' ? true : false;
    final String message = responseJson['message'];
    final data = responseJson['data'];

    if (loginSucceeded) {
      // SharedPrefHelper.userId = int.parse(data[0]['userId']);
      // SharedPrefHelper.authToken = data[0]['token'];
      // SharedPrefHelper.isLoggedIn = true;
    }
    return Response(response.statusCode, responseJson);
  }

  static Future<Response> sponsorsListCall() async {
    //making the api call
    final http.Response response = await Networking.get(
      Endpoints.sponsorsListUrl,
    );

    //parsing json data
    final responseJson = jsonDecode(response.body);
    return Response(response.statusCode, responseJson);
  }

  static Future<Response> refersCall() async {
    //making the api call
    final http.Response response = await Networking.get(
      Endpoints.refersGetUrl,
    );

    //parsing json data
    final responseJson = jsonDecode(response.body);
    return Response(response.statusCode, responseJson);
  }

  static Future<Response> logInWithPhoneNumber(String number) async {
    //making the api call
    final http.Response response = await Networking.get(
      'https://api.sb.stag.card91.in/issuance/v1/cardholders/$number/mpin/status',
    );

    //parsing json data
    final responseJson = jsonDecode(response.body);
    return Response(response.statusCode, responseJson);
  }
}
