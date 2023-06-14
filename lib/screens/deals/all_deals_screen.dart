import 'package:flutter/material.dart';
import 'package:yolo/screens/deals/view_deals_detail_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class AllDealsScreen extends StatefulWidget {
  static const String route = 'AllDealsScreen';
  const AllDealsScreen({Key? key}) : super(key: key);

  @override
  State<AllDealsScreen> createState() => _AllDealsScreenState();
}

class _AllDealsScreenState extends State<AllDealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.greyFont,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Deals',
          style: Poppins.bold(AppColors.blackFont).s18,
        ),
      ),
      body: SingleChildScrollView(
        child: listOfDelas(),
      ),
    );
  }

  Widget listOfDelas() {
    return GridView.builder(
      itemCount: 15,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 35,
        crossAxisSpacing: 20,
        childAspectRatio: 0.2 / 0.24,
      ),
      itemBuilder: (ctx, i) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ViewDealsDetailScreen.route,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyBtnColor,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: AppColors.whiteColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/Rectangle 144.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'GEETANJALI SALON',
                    style: Poppins.bold(AppColors.blackFont).s16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                  child: Text(
                    'Get Rs. 40 Cashbacks \non trail',
                    textAlign: TextAlign.center,
                    style: Poppins.regular(AppColors.blackFont).s14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
