import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class NameRegisterTitle extends StatelessWidget {
  const NameRegisterTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Perfect, May I know your\nname?',
      style: Poppins.semiBold().s22,
    );
  }
}
