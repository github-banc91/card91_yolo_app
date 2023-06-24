import 'package:flutter/material.dart';
import 'package:yolo/data/remote/model/account_details_model.dart';
import 'package:yolo/data/remote/model/log_in_model.dart';
import 'package:yolo/data/repo/auth_repo.dart';

import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/utils/view_model.dart';

class AuthViewModel extends ViewModel {
  TextEditingController loginMPINController = TextEditingController();
  TextEditingController loginMobileController = TextEditingController();
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginOtp1 = TextEditingController();
  TextEditingController loginOtp2 = TextEditingController();
  TextEditingController loginOtp3 = TextEditingController();
  TextEditingController loginOtp4 = TextEditingController();
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController confirmPin1 = TextEditingController();
  TextEditingController confirmPin2 = TextEditingController();
  TextEditingController confirmPin3 = TextEditingController();
  TextEditingController confirmPin4 = TextEditingController();
  TextEditingController confirmPin5 = TextEditingController();
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpDob = TextEditingController();

  void logInWithMobileNumber(context) {
    callApi(() async {
      final response =
          await RequestRepo.logInWithPhoneNumber(loginPhoneController.text);
      if (response.status == 200) {
        var data = LogIn.fromJson(response.data);
        if (data.mpinExists == true) {
          // Navigator.pushNamed(
          //   context,
          //   SignInMpinFingerprintScreen.route,
          // );
        } else {
          //Make the changes here
        }
      }
    });
  }

  void logInWithMpin(context) {
    callApi(() async {
      final response = await RequestRepo.loginWithMpin({
        "mobile": "91${loginPhoneController.text}",
        "mpin": loginMPINController.text
      });
      print("status code - ${response.status}");
      if (response.status == 200) {
        AccountDetails.fromJson(response.data);
        Navigator.pushNamed(
          context,
          DashboardScreen.route,
        );
      }
    });
  }
}
