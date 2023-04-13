import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome back',
      style: RedHat.bold(AppColors.appTheme).s32,
    );
  }
}
