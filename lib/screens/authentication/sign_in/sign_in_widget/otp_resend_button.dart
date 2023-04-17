import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class OTPResend extends StatelessWidget {
  const OTPResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Resend OTP',
      style: Poppins.medium(
        AppColors.greyCard,
      ).s15,
    );
  }
}
