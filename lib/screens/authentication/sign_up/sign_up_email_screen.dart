import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/email_field.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/email_register_title.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/email_submit_button.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class SignUpEmailScreen extends StatefulWidget {
  static const String route = "SignUpEmailScreen";

  const SignUpEmailScreen({Key? key}) : super(key: key);

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: AppColors.blackFont,
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(35, 20, 35, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const EmailRegisterTitle(name: 'Rupesh'),
            getSize(height: 15),
            const EmailField(),
            const Spacer(),
            const EmailSubmitButton(),
          ],
        ),
      ),
    );
  }
}
