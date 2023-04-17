import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class ForgotMPINWidget extends StatelessWidget {
  const ForgotMPINWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Forgot MPIN?',
        style: Poppins.regular().s16,
      ),
    );
  }
}
