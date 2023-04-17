import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/mpin_field.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/mpin_setup_title.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/mpin_submit_button.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/setup_mpin_subtitle.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class SetMPINScreen extends StatefulWidget {
  static const String route = 'SetMPINScreen';
  const SetMPINScreen({Key? key}) : super(key: key);

  @override
  State<SetMPINScreen> createState() => _SetMPINScreenState();
}

class _SetMPINScreenState extends State<SetMPINScreen> {
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
            const SetupMPINTitle(),
            getSize(height: 15),
            const SetupMPINSubtitle(),
            getSize(height: 15),
            const MPINField(),
            const Spacer(),
            const MPINSubmitButton(),
          ],
        ),
      ),
    );
  }
}
