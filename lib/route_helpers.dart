import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mobile_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
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
      DashboardScreen.route: (_) => ChangeNotifierProvider(
            create: (_) => dashboardViewModel,
            child: const DashboardScreen(),
          ),
    };
  }
}
