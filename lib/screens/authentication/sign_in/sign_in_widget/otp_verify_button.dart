import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';

class OTPVerifyButton extends StatelessWidget {
  const OTPVerifyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
