import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class RecommendationWidget extends StatelessWidget {
  const RecommendationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommendation',
          style: Poppins.bold(AppColors.blackFont).s20,
        ),
        getSize(height: 20),
        Container(
          padding: const EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                Color(0xff2D4C9D),
                Color(0xff180909),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Activate your min KYC To start \nusing YOLO',
                style: Poppins.bold(AppColors.whiteColor).s15,
              ),
              getSize(height: 40),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(
                  'Activate now',
                  style: Poppins.bold(AppColors.blackFont).s16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
