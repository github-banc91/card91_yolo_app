import 'package:flutter/material.dart';
import 'package:yolo/data/remote/model/account_details_model.dart';
import 'package:yolo/data/remote/model/log_in_model.dart';
import 'package:yolo/data/repo/auth_repo.dart';
import 'package:yolo/screens/authentication/sign_in/otp_verification_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/authentication/sign_up/add_fingerprint_screen.dart';
import 'package:yolo/screens/authentication/sign_up/set_mpin_screen.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_dob_screen.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_email_screen.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_name_screen.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
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

  void getOtpFun(context) {
    if (loginMobileController.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        OTPVerificationScreen.route,
        arguments: loginMobileController.text.toString(),
      );
    } else {
      showToast('Please enter mobile number', AppColors.redError);
    }
  }

  void verifyOtp(context) {
    if (loginOtp1.text.isNotEmpty &&
        loginOtp2.text.isNotEmpty &&
        loginOtp3.text.isNotEmpty &&
        loginOtp4.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        SignUpNameScreen.route,
      );
    } else {
      showToast('Please enter otp', AppColors.redError);
    }
  }

  void submitName(context) {
    if (signUpName.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        SignUpEmailScreen.route,
      );
    } else {
      showToast('Please enter name', AppColors.redError);
    }
  }

  void submitEmail(context) {
    if (signUpEmail.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        SignUpDOBScreen.route,
      );
    } else {
      showToast('Please enter email', AppColors.redError);
    }
  }

  void submitDOB(context) {
    if (signUpDob.text.isNotEmpty) {
      Navigator.pushNamed(
        context,
        SetMPINScreen.route,
      );
    } else {
      showToast('Please enter date of birth', AppColors.redError);
    }
  }

  void logInWithMobileNumber(context) {
    callApi(() async {
      final response =
          await RequestRepo.logInWithPhoneNumber(loginPhoneController.text);
      if (response.status == 200) {
        var data = LogIn.fromJson(response.data);
        if (data.mpinExists == true) {
          Navigator.pushNamed(
            context,
            SignInMpinFingerprintScreen.route,
          );
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

  void setMpin(context) {
    if (pin1.text.isNotEmpty &&
        pin2.text.isNotEmpty &&
        pin3.text.isNotEmpty &&
        pin4.text.isNotEmpty &&
        pin5.text.isNotEmpty) {
      if (confirmPin1.text.isNotEmpty &&
          confirmPin2.text.isNotEmpty &&
          confirmPin3.text.isNotEmpty &&
          confirmPin4.text.isNotEmpty &&
          confirmPin5.text.isNotEmpty) {
        if (pin1.text == confirmPin1.text &&
            pin2.text == confirmPin2.text &&
            pin3.text == confirmPin3.text &&
            pin4.text == confirmPin4.text &&
            pin5.text == confirmPin5.text) {
          Navigator.pushNamed(
            context,
            AddFingerPrintScreen.route,
          );
        } else {
          showToast('Confirm pin is not same as pin', AppColors.redError);
        }
      } else {
        showToast('Please confirm pin again', AppColors.redError);
      }
    } else {
      showToast('Please enter pin', AppColors.redError);
    }
  }
}
