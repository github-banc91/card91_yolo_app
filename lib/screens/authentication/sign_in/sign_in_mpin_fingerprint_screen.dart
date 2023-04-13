import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/fingerprint_login_option.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_mpin_text.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_with_otp_text.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/logo_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/proceed_button.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/welcome_widget.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class SignInMpinFingerprintScreen extends StatefulWidget {
  static const String route = "SignInMpinFingerprintScreen";

  const SignInMpinFingerprintScreen({Key? key}) : super(key: key);

  @override
  State<SignInMpinFingerprintScreen> createState() =>
      _SignInMpinFingerprintScreenState();
}

class _SignInMpinFingerprintScreenState
    extends State<SignInMpinFingerprintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appTheme,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CommonCardView(
            child: Column(
              children: [
                getSize(height: 15),
                const LogoWidget(),
                getSize(height: 35),
                const WelcomeWidget(),
                getSize(height: 20),
                const LoginWithMpin(),
                getSize(height: 20),
                const ProceedButton(),
                getSize(height: 20),
                const LoginWithOtpText(),
                getSize(height: 20),
                const FingerPrintLoginOption()
              ],
            ),
          ),
          Image.asset('assets/images/rocket.png'),
        ],
      ),
    );
  }
}
