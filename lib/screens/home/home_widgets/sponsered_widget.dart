import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class SponsoredWidget extends StatelessWidget {
  const SponsoredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sponsored',
          style: Poppins.bold(AppColors.blackFont).s20,
        ),
        getSize(height: 20),
        Container(),
      ],
    );
  }
}
