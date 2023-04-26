import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/add_referral/add_referral_screen.dart';
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
import 'package:yolo/screens/deals/all_deals_screen.dart';
import 'package:yolo/screens/deals/view_delas_detail_screen.dart';
import 'package:yolo/screens/home/home_screen.dart';
import 'package:yolo/screens/home/home_view_model.dart';
import 'package:yolo/screens/refer/refer_a_user_screen.dart';
import 'package:yolo/screens/scan_and_pay/scan_and_pay.dart';

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
      AddReferralScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const AddReferralScreen(),
          ),
      DashboardScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => dashboardViewModel,
            child: const DashboardScreen(),
          ),
      ScanAndPay.route: (_) => ChangeNotifierProvider(
            create: (_) => dashboardViewModel,
            child: const ScanAndPay(),
          ),
      HomeScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
              ChangeNotifierProvider(create: (_) => dashboardViewModel),
            ],
            child: const HomeScreen(),
          ),
      AllDealsScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ],
            child: const AllDealsScreen(),
          ),
      ViewDealsDetailScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ],
            child: const ViewDealsDetailScreen(),
          ),
      ReferUserScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ],
            child: const ReferUserScreen(),
          ),
    };
  }
}
