import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yolo/data/local/shared_pref_helper.dart';
import 'package:yolo/route_helpers.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mobile_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_mobile_submit_button.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox('db');
  await Prefs.init();
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
    return ProviderScope(
      child: MaterialApp(
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
        routes: {
          'SignInMobileScreen': (context) => const SignInMobileScreen(),
          'SignInMpinFingerprintScreen': (context) =>
              const SignInMpinFingerprintScreen(),
          'DashboardScreen': (context) => const DashboardScreen(),
        },
      ),
    );
  }

  String initialRoute() {
    final name = Hive.box('db').get('name');
    final mobile = Hive.box('db').get('mobile');
    if (name == null || name == '' || mobile == null || mobile == '') {
      return 'SignInMobileScreen';
    } else {
      return 'SignInMpinFingerprintScreen';
    }
  }
}
