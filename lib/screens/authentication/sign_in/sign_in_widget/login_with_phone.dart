import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class LogInWithPhoneNumber extends StatelessWidget {
  const LogInWithPhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login with Phone Number',
      style: RedHat.regular().s20,
    );
  }
}
