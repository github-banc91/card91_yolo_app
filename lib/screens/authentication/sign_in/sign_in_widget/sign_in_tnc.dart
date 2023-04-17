import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class SignInTnC extends StatelessWidget {
  const SignInTnC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'By continuing you agree to our  of use ',
            style: Poppins.medium().s14,
          ),
          Text(
            'Terms ',
            style: Poppins.medium(AppColors.appTheme).s14,
          ),
          Text(
            'and ',
            style: Poppins.medium().s14,
          ),
          Text(
            'privacy policy',
            style: Poppins.medium(AppColors.appTheme).s14,
          )
        ],
      ),
    );
  }
}
