import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class HomeOptionsWidget extends StatelessWidget {
  const HomeOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        commonContainer('assets/icons/scan and pay.svg', () {}),
        getSize(width: 25),
        commonContainer('assets/icons/my qr.svg', () {}),
        getSize(width: 25),
        commonContainer('assets/icons/transfer his.svg', () {}),
        getSize(width: 25),
        commonContainer('assets/icons/refer.svg', () {}),
      ],
    );
  }

  Widget commonContainer(image, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.greyCard,
            width: 2,
          ),
          shape: BoxShape.circle,
          color: AppColors.greyTextFormField,
        ),
        padding: const EdgeInsets.all(12),
        child: SvgPicture.asset(
          image,
          height: 35,
        ),
      ),
    );
  }
}
