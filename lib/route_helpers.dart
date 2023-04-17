import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/screens/authentication/sign_in/otp_verification_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mobile_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/authentication/sign_up/add_fingerprint_screen.dart';
import 'package:yolo/screens/authentication/sign_up/set_mpin_screen.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_dob_screen.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_email_screen.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_name_screen.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';

class RouteHelper {
  Map<String, WidgetBuilder> createRoutes() {
    final authRequestViewModel = AuthViewModel();
    final dashboardViewModel = AuthViewModel();
    return {
      SignInMpinFingerprintScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => authRequestViewModel),
              ChangeNotifierProvider(create: (_) => dashboardViewModel),
            ],
            child: const SignInMpinFingerprintScreen(),
          ),
      SignInMobileScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const SignInMobileScreen(),
          ),
      OTPVerificationScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const OTPVerificationScreen(),
          ),
      SignUpNameScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const SignUpNameScreen(),
          ),
      SignUpEmailScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const SignUpEmailScreen(),
          ),
      SignUpDOBScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const SignUpDOBScreen(),
          ),
      SetMPINScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const SetMPINScreen(),
          ),
      AddFingerPrintScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const AddFingerPrintScreen(),
          ),
      DashboardScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => dashboardViewModel,
            child: const DashboardScreen(),
          ),
    };
  }
}
