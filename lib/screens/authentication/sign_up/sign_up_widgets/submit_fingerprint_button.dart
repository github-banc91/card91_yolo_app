import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';

import '../../../../utils/typography.dart';

class SubmitFingerprintButton extends StatelessWidget {
  const SubmitFingerprintButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.read<AuthViewModel>().submitName(context);
      },
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width * 0.6,
          // margin: const EdgeInsets.only(left: 40, right: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greyFont.withOpacity(0.6),
          ),
          alignment: Alignment.center,
          child: Text(
            'Use Touch ID',
            style: Poppins.semiBold().s18,
          ),
        ),
      ),
    );
  }
}
