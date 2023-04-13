import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'YOLO',
      style: RedHat.bold().s24,
    );
  }
}
