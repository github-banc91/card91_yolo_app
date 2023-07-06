import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/providers/verify_referal_code_provider.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/network.dart';
import 'package:yolo/utils/typography.dart';

class AddReferralScreen extends ConsumerStatefulWidget {
  const AddReferralScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddReferralScreenState();
}

class _AddReferralScreenState extends ConsumerState<AddReferralScreen> {
  late TextEditingController referCodeController;
  @override
  void initState() {
    super.initState();
    referCodeController = TextEditingController();
  }

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
        controller: referCodeController,
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
            if (referCodeController.text != "") {
              print("referCodeController.text ${referCodeController.text}");
              requestBody = {
                "ref_code": referCodeController.text,
                "phone_number":
                    Hive.box('db').get('phoneNumber').toString().split('91')[1],
                "email": "hello@gmaill.com",
                "name": "xyz abc",
                "dateOfBirth": "2000-12-23"
              };
              ref.read(verifyReferalCodeProvider).then((value) {
                Map<String, dynamic> result = jsonDecode(value.body);
                if (value.statusCode == 200) {
                  Navigator.pushNamed(context, "ResetMpin");
                } else {
                  showToast(result['message'], AppColors.redError);
                }
              });
            } else {
              showToast("please enter the referal code", AppColors.redError);
            }
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
