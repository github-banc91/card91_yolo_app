import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class LoginWithMpin extends StatelessWidget {
  const LoginWithMpin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login with MPIN',
      style: RedHat.regular().s20,
    );
  }
}
