import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';

class OTPVerifyButton extends StatelessWidget {
  const OTPVerifyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthViewModel>().verifyOtp(context);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.appTheme,
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.arrow_forward,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
