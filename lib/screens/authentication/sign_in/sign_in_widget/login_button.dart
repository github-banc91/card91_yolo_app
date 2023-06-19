import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: size(context).width * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: AppColors.blackFont,
        ),
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Text(
          'LogIn',
          style: RedHat.bold(AppColors.whiteColor).s20,
        ),
      ),
    );
  }
}
