import 'dart:convert';

import 'package:yolo/data/remote/utils/endpoints.dart';
import 'package:yolo/data/remote/utils/networking.dart';
import 'package:yolo/data/repo/response_data.dart';

class RequestRepo {
  static Future<Response> loginCall(String mobile) async {
    //making the api call
    Map<String, String> body = {
      "mobile": mobile,
    };
    final response = await Networking.post(
      Endpoints.loginUrl,
      jsonEncode(body),
    );

    final responseJson = jsonDecode(response);
    final bool loginSucceeded = responseJson['status'] == 'true' ? true : false;
    final String message = responseJson['message'];

    return Response(loginSucceeded, message, responseJson);
  }

  static Future<Response> otpVerifyCall(String otp) async {
    //making the api call
    final response = await Networking.post(
      Endpoints.verifyOtpUrl,
      jsonEncode({'otp': otp}),
    );
    //parsing json data
    final responseJson = jsonDecode(response);
    final bool loginSucceeded = responseJson['status'] == 'true' ? true : false;
    final String message = responseJson['message'];
    final data = responseJson['data'];

    if (loginSucceeded) {
      // SharedPrefHelper.userId = int.parse(data[0]['userId']);
      SharedPrefHelper.authToken = data[0]['token'];
      SharedPrefHelper.isLoggedIn = true;
    }
    return Response(loginSucceeded, message, responseJson);
  }
}
