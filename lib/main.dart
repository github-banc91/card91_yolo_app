import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:yolo/data/local/shared_pref_helper.dart';
import 'package:yolo/route_helpers.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Prefs.init();

  runApp(
    Provider<RouteHelper>(
      create: (_) => RouteHelper(),
      child: const MyApp(),
    ),
  );
}

// GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.red,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        fontFamily: 'RedHat',
      ),
      initialRoute: initialRoute(),
      routes: RouteHelper().createRoutes(),
    );
  }

  String initialRoute() {
    if (Prefs.isLoggedIn.get()) {
      return DashboardScreen.route;
    } else {
      return SignInMpinFingerprintScreen.route;
    }
  }
}
