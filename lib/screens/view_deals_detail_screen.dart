import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class ViewDealsDetailScreen extends StatefulWidget {
  static const String route = 'ViewDealsDetailScreen';
  const ViewDealsDetailScreen({Key? key}) : super(key: key);

  @override
  State<ViewDealsDetailScreen> createState() => _ViewDealsDetailScreenState();
}

class _ViewDealsDetailScreenState extends State<ViewDealsDetailScreen> {
  var data = ['data1', 'data2', 'data3', 'data4', 'data5', 'data6', 'data7'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE0C4B6),
      bottomSheet: bottomSheet(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 50,
          left: 15,
          right: 15,
          bottom: 85,
        ),
        child: Column(
          children: [
            topImage(),
            infoContainer(),
            getSize(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: const Color(0xff765C5D),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: ExpansionTile(
                  backgroundColor: const Color(0xff765C5D),
                  iconColor: AppColors.whiteColor,
                  title: Text(
                    '29029 times unlocked',
                    style: Poppins.bold(AppColors.whiteColor).s18,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 1, 15, 15),
                      child: Text(
                        'Get Flat 1000 OFF on any service at any of the 120+ outlets of Geetanjali Salon. The minimum service invoice value shouldbe 2000',
                        style: Poppins.regular(AppColors.whiteColor).s15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topImage() {
    return SizedBox(
      height: 420,
      width: double.infinity,
      child: Image.network(
        'https://picsum.photos/250?image=234',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget infoContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.whiteBgColor,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'KEY POINTS',
            style: Poppins.bold(AppColors.blackFont).s18,
          ),
          for (int p = 0; p < 8; p++)
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: AppColors.blackFont,
                  ),
                  getSize(width: 10),
                  Text(
                    'The minimum service invoice value should\nbe 2000',
                    style: Poppins.semiBold(AppColors.blackFont).s14,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.blackFont,
      ),
      alignment: Alignment.center,
      child: Text(
        'Redeem Offer',
        style: Poppins.bold(AppColors.whiteColor).s18,
      ),
    );
  }
}
