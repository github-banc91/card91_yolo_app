import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/data/local/shared_pref_helper.dart';
import 'package:yolo/screens/authentication/sign_in/on_boarding.dart';
import 'package:yolo/screens/authentication/sign_in/on_boarding_kyc.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mobile_screen.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/screens/deals/all_deals_screen.dart';
import 'package:yolo/screens/refer/refer_a_user_screen.dart';
import 'package:yolo/screens/scan_and_pay/scan_and_pay.dart';
import 'package:yolo/utils/network_utils.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox('db');
  await Prefs.init();
  requestBody = {"email": "abc@gmail.com", "password": "xyz.efg"};
  runApp(const ProviderScope(child: MyApp()));
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
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
      routes: {
        'SignInMobileScreen': (context) => const SignInMobileScreen(),
        'SignInMpinFingerprintScreen': (context) =>
            const SignInMpinFingerprintScreen(),
        'DashboardScreen': (context) => const DashboardScreen(),
        'OnBoarding': (context) => const OnBoarding(),
        'OnBoardingKYC': (context) => const OnBoardingKYC(),
        'ReferUserScreen': (context) => const ReferUserScreen(),
        'AllDealsScreen': (context) => const AllDealsScreen(),
        'ScanAndPay': (context) => const ScanAndPay(),
      },
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
