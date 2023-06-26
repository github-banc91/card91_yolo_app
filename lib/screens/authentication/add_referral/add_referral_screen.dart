import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yolo/screens/dashboard/dashboard_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class AddReferralScreen extends StatefulWidget {
  static const String route = 'AddReferralScreen';
  const AddReferralScreen({Key? key}) : super(key: key);

  @override
  State<AddReferralScreen> createState() => _AddReferralScreenState();
}

class _AddReferralScreenState extends State<AddReferralScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SvgPicture.asset(
            'assets/images/referral_screen_bg.svg',
            width: size.width,
            fit: BoxFit.contain,
          ),
          Container(
            height: size.height,
            width: size.width,
            margin: const EdgeInsets.only(top: 180, bottom: 25),
            child: Column(
              children: [
                const CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/250?image=9',
                  ),
                ),
                getSize(height: 40),
                titleText(),
                const Spacer(),
                nextButton(),
              ],
            ),
          ),
          referralCodeField(),
        ],
      ),
    );
  }

  Widget titleText() => Text(
        'Referral code',
        style: Poppins.bold(AppColors.blackFont).s24,
      );

  Widget referralCodeField() {
    return Padding(
      padding: const EdgeInsets.only(top: 450, left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: Poppins.semiBold().s20,
        decoration: InputDecoration(
          labelText: 'Referral code',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.blackFont,
            ),
          ),
          hintStyle: Poppins.medium().s16,
        ),
      ),
    );
  }

  Widget nextButton() => Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "");
          },
          child: Container(
            height: 50,
            width: size(context).width * 0.4,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.blackFont,
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(
              'Next',
              style: RedHat.bold(AppColors.whiteColor).s20,
            ),
          ),
        ),
      );
}
