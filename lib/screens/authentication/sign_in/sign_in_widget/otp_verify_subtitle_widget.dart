import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class OTPVerifySubtitleWidget extends StatelessWidget {
  final String mobileNo;
  const OTPVerifySubtitleWidget({
    Key? key,
    required this.mobileNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          Text(
            'OTP sent to $mobileNo. ',
            style: Poppins.medium(
              AppColors.greyCard,
            ).s15,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              'Edit ',
              style: Poppins.medium(AppColors.appTheme).s14,
            ),
          ),
        ],
      ),
    );
  }
}
