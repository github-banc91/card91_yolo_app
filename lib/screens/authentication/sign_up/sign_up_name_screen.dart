import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/name_field.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/name_register_title.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/name_submit_button.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class SignUpNameScreen extends StatefulWidget {
  static const String route = "SignUpNameScreen";

  const SignUpNameScreen({Key? key}) : super(key: key);

  @override
  State<SignUpNameScreen> createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
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
            const NameRegisterTitle(),
            getSize(height: 15),
            const NameField(),
            const Spacer(),
            const NameSubmitButton(),
          ],
        ),
      ),
    );
  }
}
