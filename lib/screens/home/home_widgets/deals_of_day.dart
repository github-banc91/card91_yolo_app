import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class DealsOfDay extends StatelessWidget {
  const DealsOfDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deals of the day',
          style: Poppins.bold(AppColors.blackFont).s20,
        ),
        // getSize(height: 20),
        Image.asset('assets/images/nyka deal.png'),
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            shrinkWrap: true,
            itemBuilder: (ctx, i) {
              return Image.asset(
                'assets/images/deal 50%.png',
                width: 160,
                height: 140,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
      ],
    );
  }
}
