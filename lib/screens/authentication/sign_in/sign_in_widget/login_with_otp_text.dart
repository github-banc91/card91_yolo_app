import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_mobile_screen.dart';
import 'package:yolo/utils/typography.dart';

class LoginWithOtpText extends StatelessWidget {
  const LoginWithOtpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, SignInMobileScreen.route),
      child: Text(
        'Login with OTP',
        style: Poppins.regular().s14,
      ),
    );
  }
}
