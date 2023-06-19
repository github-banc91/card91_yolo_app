import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/add_referral/add_referral_screen.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mobile_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/screens/deals/all_deals_screen.dart';
import 'package:yolo/screens/deals/view_deals_detail_screen.dart';
import 'package:yolo/screens/home/home_screen.dart';
import 'package:yolo/screens/home/home_view_model.dart';
import 'package:yolo/screens/refer/refer_a_user_screen.dart';
import 'package:yolo/screens/scan_and_pay/mpin_for_pay_screen.dart';
import 'package:yolo/screens/scan_and_pay/pay_now_screen.dart';
import 'package:yolo/screens/scan_and_pay/payment_status_screen.dart';
import 'package:yolo/screens/scan_and_pay/scan_and_pay.dart';
import 'package:yolo/screens/scan_and_pay/user_info_screen.dart';

class RouteHelper {
  Map<String, WidgetBuilder> createRoutes() {
    final authRequestViewModel = AuthViewModel();
    final dashboardViewModel = AuthViewModel();
    return {
      // SignInMpinFingerprintScreen.route: (_) => MultiProvider(
      //       providers: [
      //         ChangeNotifierProvider(create: (_) => authRequestViewModel),
      //         ChangeNotifierProvider(create: (_) => dashboardViewModel),
      //       ],
      //       child: const SignInMpinFingerprintScreen(
      //         mobileNumber: '',
      //       ),
      //     ),
      // LogInMobileScreen.route: (_) => MultiProvider(
      //       providers: [
      //         ChangeNotifierProvider(create: (_) => authRequestViewModel),
      //         ChangeNotifierProvider(create: (_) => dashboardViewModel),
      //       ],
      //       child: const LogInMobileScreen(),
      //     ),

      AddReferralScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => authRequestViewModel,
            child: const AddReferralScreen(),
          ),
      // DashboardScreen.route: (_) => ChangeNotifierProvider(
      //       create: (_) => dashboardViewModel,
      //       child: const DashboardScreen(),
      //     ),
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
      DashboardScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
              ChangeNotifierProvider(create: (_) => dashboardViewModel),
            ],
            child: const DashboardScreen(),
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
      UserInfoScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ],
            child: const UserInfoScreen(),
          ),
      PayNowScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
            ],
            child: const PayNowScreen(),
          ),
      MPINForPayScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
              ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ],
            child: const MPINForPayScreen(),
          ),
      PaymentStatusScreen.route: (_) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => HomeViewModel()),
              ChangeNotifierProvider(create: (_) => AuthViewModel()),
            ],
            child: const PaymentStatusScreen(),
          ),
    };
  }
}
