import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/utils/typography.dart';

class LoginWithMpin extends StatelessWidget {
  const LoginWithMpin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login with ${Hive.box('db').get('mobile') ?? ''} MPIN',
      style: RedHat.regular().s20,
    );
  }
}
