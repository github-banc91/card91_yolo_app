import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolo/providers/cardholder_data_provider.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class HomeOptionsWidget extends ConsumerWidget {
  const HomeOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        commonContainer(
          'Scan & Pay',
          'assets/icons/scan and pay.svg',
          () {
            Navigator.pushNamed(context, 'ScanAndPay');
          },
        ),
        getSize(width: 20),
        commonContainer('My Qr', 'assets/icons/my qr.svg', () {
          ref.read(cardHolderDataProvider);
        }),
        getSize(width: 20),
        commonContainer('Transaction', 'assets/icons/transfer his.svg', () {}),
        getSize(width: 20),
        commonContainer('Refer', 'assets/icons/refer.svg', () {}),
      ],
    );
  }

  Widget commonContainer(title, image, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyCard,
                width: 3,
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
          getSize(height: 10),
          Text(
            title,
            style: Poppins.regular(AppColors.blackFont).s12,
          ),
        ],
      ),
    );
  }
}
