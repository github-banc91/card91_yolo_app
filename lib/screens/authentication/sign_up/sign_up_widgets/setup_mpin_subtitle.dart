import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class SetupMPINSubtitle extends StatelessWidget {
  const SetupMPINSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'To setup your MPIN create 5 digit code and confirm it below',
      style: Poppins.regular().s16,
    );
  }
}
