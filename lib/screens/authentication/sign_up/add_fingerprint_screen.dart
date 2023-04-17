import 'package:flutter/material.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/image_biometric.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/submit_fingerprint_button.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/subtitle_biometric.dart';
import 'package:yolo/screens/authentication/sign_up/sign_up_widgets/title_biometric.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

import '../../../utils/typography.dart';

class AddFingerPrintScreen extends StatefulWidget {
  static const String route = 'AddFingerPrintScreen';
  const AddFingerPrintScreen({Key? key}) : super(key: key);

  @override
  State<AddFingerPrintScreen> createState() => _AddFingerPrintScreenState();
}

class _AddFingerPrintScreenState extends State<AddFingerPrintScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSize(height: MediaQuery.of(context).size.height * 0.15),
            const TitleBiometric(),
            getSize(height: 20),
            const ImageBiometric(),
            getSize(height: 20),
            const SubtitleBiometric(),
            getSize(height: 50),
            const SubmitFingerprintButton(),
            getSize(height: 25),
            laterBtn(),
          ],
        ),
      ),
    );
  }

  Widget laterBtn() => GestureDetector(
        child: Text(
          'Later',
          style: Poppins.semiBold().s18,
        ),
      );
}
