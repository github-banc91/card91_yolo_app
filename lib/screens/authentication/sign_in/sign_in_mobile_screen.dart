import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/logo_widget.dart';
import 'package:yolo/utils/app_colors.dart';

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
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CommonCardView(
            child: Column(
              children: [
                LogoWidget(),
              ],
            ),
          ),
          Image.asset('assets/images/mobile in hand.png'),
        ],
      ),
    );
  }
}
