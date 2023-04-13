import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class FingerPrintLoginOption extends StatelessWidget {
  const FingerPrintLoginOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: size(context).width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.blackFont,
        ),
      ),
      padding: const EdgeInsets.all(5),
      child: SvgPicture.asset(
        'assets/icons/fingerprint.svg',
      ),
    );
  }
}
