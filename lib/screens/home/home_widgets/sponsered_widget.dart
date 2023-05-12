import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/data/remote/model/sponsors_list_model.dart';
import 'package:yolo/screens/home/home_view_model.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class SponsoredWidget extends StatelessWidget {
  const SponsoredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AllSponsors> sponsors = context.watch<HomeViewModel>().sponsors;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Sponsored',
            style: Poppins.bold(AppColors.blackFont).s20,
          ),
          getSize(height: 20),
          Wrap(
            runSpacing: 5,
            spacing: 10,
            children: [
              for (int i = 0; i < sponsors.length; i++)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(
                          sponsors[i].displayImgUrl ?? '',
                          height: 100,
                          width: 80,
                          errorBuilder: (a, s, _) {
                            return Icon(
                              Icons.error,
                              color: AppColors.redError,
                            );
                          },
                        ),
                        Text(
                          sponsors[i].title ?? '',
                          style: Poppins.bold(AppColors.blackFont).s14,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
