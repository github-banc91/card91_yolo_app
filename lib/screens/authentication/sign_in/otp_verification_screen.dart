import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/otp_fields.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/otp_resend_button.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/otp_verify_button.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/otp_verify_subtitle_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/otp_verify_title_widget.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class OTPVerificationScreen extends StatefulWidget {
  static const String route = "OTPVerificationScreen";

  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    var mobile = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.appTheme,
      resizeToAvoidBottomInset: false,
      body: CommonCardView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSize(height: 30),
            const OTPVerifyTitleWidget(),
            getSize(height: 25),
            OTPVerifySubtitleWidget(mobileNo: mobile.toString()),
            getSize(height: 60),
            const OTPFields(),
            getSize(height: 25),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  OTPResend(),
                  OTPVerifyButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
