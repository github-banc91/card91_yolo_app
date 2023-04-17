import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class OTPVerifyTitleWidget extends StatelessWidget {
  const OTPVerifyTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.blackFont,
          ),
        ),
        getSize(width: 10),
        Text(
          'Enter Login Pin sent to your \nphone number',
          style: Poppins.regular().s24,
        ),
      ],
    );
  }
}
