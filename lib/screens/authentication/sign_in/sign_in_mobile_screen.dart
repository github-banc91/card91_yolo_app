import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_mobile_submit_button.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_phone_heading.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_phone_subtitle.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/mobile_text_field.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/sign_in_tnc.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class SignInMobileScreen extends StatefulWidget {
  static const String route = "SignInMobileScreen";

  const SignInMobileScreen({Key? key}) : super(key: key);

  @override
  State<SignInMobileScreen> createState() => _SignInMobileScreenState();
}

class _SignInMobileScreenState extends State<SignInMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appTheme,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CommonCardView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getSize(height: 30),
                const LoginPhoneHeading(),
                getSize(height: 25),
                const LoginPhoneSubtitle(),
                getSize(height: 60),
                const MobileTextField(),
                getSize(height: 25),
                const SignInTnC(),
                const Spacer(),
                const LoginMobileSubmitButton(),
              ],
            ),
          ),
          Image.asset('assets/images/mobile in hand.png'),
        ],
      ),
    );
  }
}
