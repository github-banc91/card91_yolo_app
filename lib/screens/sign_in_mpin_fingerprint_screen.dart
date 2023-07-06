import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:yolo/screens/widgets/common_card_view.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/network.dart';
import 'package:yolo/utils/typography.dart';
import 'package:http/http.dart' as http;

final mpinloginProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'issuance/v1/cardholders/login/mpin',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.user,
          body: requestBody,
          headers: {
            'Content-Type': 'application/json',
          },
          protocolType: SSL.https)
      .whenComplete(
          () => ref.read(mpinLoginStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    await Hive.box('db').put('name', result['customer']['name']);
    await Hive.box('db').put('mobile', result['customer']['mobile']);
    await Hive.box('db').put('cardId', result['cards'][0]['id']);
    await Hive.box('db').put('jwt', response.headers['jwt_token']);
  }
  return response;
});

final mpinLoginStatusProvider = StateProvider<bool>((ref) {
  return false;
});

class SignInMpinFingerprintScreen extends ConsumerStatefulWidget {
  const SignInMpinFingerprintScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignInMpinFingerprintScreenState();
}

class _SignInMpinFingerprintScreenState
    extends ConsumerState<SignInMpinFingerprintScreen> {
  TextEditingController mpinController = TextEditingController();
  LocalAuthentication auth = LocalAuthentication();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool _canCheckBiometric = false;
  bool _isMpinPresent = false;
  String authorized = "Not authorized";

  Future<void> _checkBiometric() async {
    bool? canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    print('is bio metric avail $canCheckBiometric');
    setState(() {
      _canCheckBiometric = canCheckBiometric!;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType>? availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print('Exceptin>>>>>> $e');
    }
    if (!mounted) return;
    print('is bio metric avail $availableBiometric');
    setState(() {});
  }

  Future<void> _getMpin() async {
    final mpin = await storage.read(key: 'mpin');

    if (mpin != null) {
      setState(() {
        _isMpinPresent = true;
      });
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Login using your Biometric Credential",
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      authorized =
          authenticated ? "Authorized success" : "Failed to authenticate";
    });
    showToast(
      authorized,
      authenticated ? AppColors.greenColor : AppColors.redError,
    );
    if (authenticated) {
      ref.read(mpinLoginStatusProvider.notifier).state = true;
      requestBody = {
        "mobile": Hive.box('db').get('phoneNumber'),
        "mpin": await storage.read(key: 'mpin')
      };
      ref.read(mpinloginProvider).then((value) {
        Map<String, dynamic> result = jsonDecode(value.body);
        if (value.statusCode == 200) {
          Navigator.pushNamed(context, 'DashboardScreen');
        } else {
          showToast(result['message'], AppColors.redError);
        }
      });
    }
  }

  void _mpinLogin() {
    if (mpinController.text.isNotEmpty) {
      ref.read(mpinLoginStatusProvider.notifier).state = true;
      requestBody = {
        "mobile": Hive.box('db').get('phoneNumber'),
        "mpin": mpinController.text
      };
      ref.read(mpinloginProvider).then((value) async {
        Map<String, dynamic> result = jsonDecode(value.body);
        print("value.statusCode: ${value.statusCode}");
        if (value.statusCode == 200) {
          Navigator.pushNamed(context, 'DashboardScreen');
          await storage.write(key: 'mpin', value: mpinController.text);
        } else {
          showToast(result['message'], AppColors.redError);
        }
      });
    } else {
      showToast('please enter your 6 digit MPIN', AppColors.redError);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkBiometric();
    _getAvailableBiometrics();
    _getMpin();
  }

  @override
  Widget build(BuildContext context) {
    final mpinWatch = ref.watch(mpinLoginStatusProvider);
    return Scaffold(
      backgroundColor: AppColors.appTheme,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CommonCardView(
            child: Column(
              children: [
                getSize(height: 15),
                Text(
                  'YOLO',
                  style: RedHat.extraBold().s24,
                ),
                getSize(height: 40),
                Text(
                  'Welcome back',
                  style: RedHat.bold(AppColors.appTheme).s32.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Hive.box('db').get('name') != null
                    ? getSize(height: 20)
                    : const SizedBox.shrink(),
                Text(
                  '${Hive.box('db').get('name') ?? ''}',
                  style: Poppins.medium().s24,
                ),
                getSize(height: 25),
                Hive.box('db').get('mobile') != null
                    ? Text(
                        'Login with ${Hive.box('db').get('mobile') ?? ''}',
                        style: RedHat.regular().s20,
                      )
                    : const SizedBox.shrink(),
                getSize(height: 25),
                TextFormField(
                  controller: mpinController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter Your MPIN',
                    hintStyle: Poppins.medium().s16,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: AppColors.blackFont,
                        width: 1,
                      ),
                    ),
                  ),
                  style: Poppins.bold().s20,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                ),
                getSize(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Forgot MPIN?',
                    style: Poppins.regular().s16,
                  ),
                ),
                getSize(height: 25),
                mpinWatch
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.redError,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _mpinLogin();
                        },
                        child: Container(
                          height: 50,
                          width: size(context).width * 0.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            // color: AppColors.blackFont,
                          ),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Text(
                            'Proceed',
                            style: RedHat.bold(AppColors.whiteColor).s20,
                          ),
                        ),
                      ),
                getSize(height: 20),
                InkWell(
                  onTap: () async {
                    if (_canCheckBiometric) {
                      if (_isMpinPresent) {
                        _authenticate();
                      } else {
                        showToast('please enter your 6 digit MPIN first',
                            AppColors.redError);
                      }
                    } else {
                      showToast('No biometrics available', AppColors.redError);
                    }
                  },
                  child: SizedBox(
                    height: 40,
                    child: Container(
                      height: 55,
                      width: size(context).width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.blackFont,
                        ),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        'assets/icons/fingerprint.svg',
                      ),
                    ),
                  ),
                ),
                getSize(height: 20),
              ],
            ),
          ),
          Image.asset(
            'assets/images/rocket.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
