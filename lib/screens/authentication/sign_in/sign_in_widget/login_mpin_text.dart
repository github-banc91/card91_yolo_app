import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/utils/typography.dart';

class LoginWithMpin extends StatelessWidget {
  const LoginWithMpin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hive.box('db').get('mobile') != null
        ? Text(
            'Login with ${Hive.box('db').get('mobile') ?? ''}',
            style: RedHat.regular().s20,
          )
        : const SizedBox.shrink();
  }
}
