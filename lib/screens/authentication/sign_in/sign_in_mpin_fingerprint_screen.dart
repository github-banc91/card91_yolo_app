import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:yolo/providers/mpin_login_provider.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/fingerprint_login_option.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/forgot_mpin_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_mpin_text.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/logo_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/welcome_widget.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/network_utils.dart';
import 'package:yolo/utils/typography.dart';

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
  bool _canCheckBiometric = false;
  List<BiometricType>? _availableBiometric;
  String authorized = "Not authorized";

  //checking bimetrics
  //this function will check the sensors and will tell us
  // if we can use them or not
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

  //this function will get all the available biometrics inside our device
  //it will return a list of objects, but for our example it will only
  //return the fingerprint biometric
  Future<void> _getAvailableBiometrics() async {
    List<BiometricType>? availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print('Exceptin>>>>>> $e');
    }
    if (!mounted) return;
    print('is bio metric avail $availableBiometric');

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  //this function will open an authentication dialog
  // and it will check if we are authenticated or not
  // so we will add the major action here like moving to another activity
  // or just display a text that will tell us that we are authenticated
  Future<void> _authenticate() async {
    bool authenticated = false;
    print(authenticated);
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
      Navigator.pushNamedAndRemoveUntil(
        context,
        DashboardScreen.route,
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _checkBiometric();
    _getAvailableBiometrics();
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
                const LogoWidget(),
                getSize(height: 50),
                const WelcomeWidget(),
                Hive.box('db').get('name') != null
                    ? getSize(height: 20)
                    : const SizedBox.shrink(),
                Text(
                  '${Hive.box('db').get('name') ?? ''}',
                  style: Poppins.medium().s24,
                ),
                getSize(height: 25),
                const LoginWithMpin(),
                getSize(height: 45),
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
                ),
                getSize(height: 25),
                const ForgotMPINWidget(),
                getSize(height: 25),
                mpinWatch
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.redError,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          ref.read(mpinLoginStatusProvider.notifier).state =
                              true;
                          requestBody = {
                            "mobile": Hive.box('db').get('phoneNumber'),
                            "mpin": mpinController.text
                          };
                          ref.read(mpinloginProvider).then((value) {
                            if (value.statusCode == 200) {
                              Navigator.pushNamed(context, 'DashboardScreen');
                            }
                          });
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
                  onTap: () {
                    //print("hello moto");
                  },
                  child: const SizedBox(
                    height: 40,
                    child: FingerPrintLoginOption(),
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
