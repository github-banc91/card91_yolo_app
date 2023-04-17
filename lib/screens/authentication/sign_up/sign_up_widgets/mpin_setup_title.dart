import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class SetupMPINTitle extends StatelessWidget {
  const SetupMPINTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Setup your Mpin code',
      style: Poppins.semiBold().s22,
    );
  }
}
