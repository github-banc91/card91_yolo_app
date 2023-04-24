import 'package:flutter/material.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class ProceedButton extends StatelessWidget {
  const ProceedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          DashboardScreen.route,
          (route) => false,
        );
      },
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
          'Proceed',
          style: RedHat.bold(AppColors.whiteColor).s20,
        ),
      ),
    );
  }
}
