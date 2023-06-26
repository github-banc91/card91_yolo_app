import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:yolo/data/remote/model/sponsors_list_model.dart';
import 'package:yolo/providers/get_sponsors_list_provider.dart';
import 'package:yolo/screens/home/home_view_model.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class SponsoredWidget extends ConsumerWidget {
  const SponsoredWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sponsorsWatch = ref.watch(getSponsorsListProvider);
    return sponsorsWatch.when(
        data: (data) {
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
                    for (int i = 0;
                        i < List.from(data['allSponsors']).length;
                        i++)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                data['allSponsors'][i]['display_img_url'] ?? '',
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
                                data['allSponsors'][i]['title'] ?? '',
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
        },
        error: (error, stackTrace) {
          String message = '';
          // if (error is ErrorMessage) {
          //   message = error.message;
          // }

          return Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
        loading: () => const Center(
                child: CircularProgressIndicator(
              color: Color(0xFFfa9b6d),
            )));
  }
}
