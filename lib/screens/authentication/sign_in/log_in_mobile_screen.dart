import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/fingerprint_login_option.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/forgot_mpin_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_button.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_mpin_text.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_with_otp_text.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_with_phone.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/logo_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/mobile_text_field.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/mpin_text_field.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/proceed_button.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/welcome_widget.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class LogInMobileScreen extends StatefulWidget {
  static const String route = "LogInMobileScreen";

  const LogInMobileScreen({Key? key}) : super(key: key);

  @override
  State<LogInMobileScreen> createState() => _LogInMobileScreenState();
}

class _LogInMobileScreenState extends State<LogInMobileScreen> {
  @override
  Widget build(BuildContext context) {
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
                getSize(height: 25),
                const LogInWithPhoneNumber(),
                getSize(height: 45),
                const MobileTextField(),
                getSize(height: 25),
                const LogInButton(),
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
