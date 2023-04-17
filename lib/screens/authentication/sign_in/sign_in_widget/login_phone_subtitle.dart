import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class LoginPhoneSubtitle extends StatelessWidget {
  const LoginPhoneSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: Text(
        'Note: Make sure you enter your own number as it will be linked to your Fampay accoung ',
        style: Poppins.medium(
          AppColors.greyCard,
        ).s15,
      ),
    );
  }
}
