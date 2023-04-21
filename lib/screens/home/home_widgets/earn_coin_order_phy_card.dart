import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class EarnCoinAndOrderPhyCard extends StatelessWidget {
  const EarnCoinAndOrderPhyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 30, right: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff172549),
                    Color(0xff000000),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Earn Yolo Coins Now',
                    style: Poppins.bold(AppColors.whiteColor).s14,
                  ),
                  getSize(height: 10),
                  Text(
                    'Activate',
                    style: Poppins.regular(AppColors.whiteColor).s14,
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/earn coin.png',
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width * 0.65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xff1B1B1B),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/phy card.svg'),
              getSize(width: 10),
              Text(
                'Order your Physical Card',
                style: Poppins.bold(AppColors.whiteColor).s14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
