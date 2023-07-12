import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/screens/add_referral_screen.dart';
import 'package:yolo/screens/dashboard_screen.dart';
import 'package:yolo/screens/all_deals_screen.dart';
import 'package:yolo/screens/mpin_for_pay_screen.dart';
import 'package:yolo/screens/on_boarding.dart';
import 'package:yolo/screens/on_boarding_kyc.dart';
import 'package:yolo/screens/pay_now_screen.dart';
import 'package:yolo/screens/payment_status_screen.dart';
import 'package:yolo/screens/qr_screen.dart';
import 'package:yolo/screens/refer_a_user_screen.dart';
import 'package:yolo/screens/reset_mpin_screen.dart';
import 'package:yolo/screens/scan_and_pay.dart';
import 'package:yolo/screens/scan_n_pay.dart';
import 'package:yolo/screens/scan_screen.dart';
import 'package:yolo/screens/sign_in_mobile_screen.dart';
import 'package:yolo/screens/sign_in_mpin_fingerprint_screen.dart';
import 'package:yolo/screens/user_info_screen.dart';
import 'package:yolo/screens/view_deals_detail_screen.dart';
import 'package:yolo/utils/network.dart';

GetIt locator = GetIt.instance;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox('db');
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
        'AddReferralScreen': (context) => const AddReferralScreen(),
        'AllDealsScreen': (context) => const AllDealsScreen(),
        'DashboardScreen': (context) => const DashboardScreen(),
        'MPINForPayScreen': (context) => const MPINForPayScreen(),
        'OnBoarding': (context) => const OnBoarding(),
        'OnBoardingKYC': (context) => const OnBoardingKYC(),
        'PaymentStatusScreen': (context) => const PaymentStatusScreen(),
        'QrScreen': (context) => const QrScreen(),
        'ReferUserScreen': (context) => const ReferUserScreen(),
        'ResetMpin': (context) => const ResetMpin(),
        'ScanAndPay': (context) => const ScanAndPay(),
        'ScanNpay': (context) => const ScanNpay(),
        'ScanScreen': (context) => const ScanScreen(),
        'SignInMobileScreen': (context) => const SignInMobileScreen(),
        'SignInMpinFingerprintScreen': (context) =>
            const SignInMpinFingerprintScreen(),
        'UserInfoScreen': (context) => const UserInfoScreen(),
        'ViewDealsDetailScreen': (context) => const ViewDealsDetailScreen(),
        'PayNowScreen': (context) => const PayNowScreen(),
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
