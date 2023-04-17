import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/dob_field.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/dob_resister_title.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/dob_submit_button.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class SignUpDOBScreen extends StatefulWidget {
  static const String route = "SignUpDOBScreen";

  const SignUpDOBScreen({Key? key}) : super(key: key);

  @override
  State<SignUpDOBScreen> createState() => _SignUpDOBScreenState();
}

class _SignUpDOBScreenState extends State<SignUpDOBScreen> {
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
            const DOBRegisterTitle(name: 'Rupesh'),
            getSize(height: 15),
            const DOBField(),
            const Spacer(),
            const DOBSubmitButton(),
          ],
        ),
      ),
    );
  }
}
