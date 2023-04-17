import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class SubtitleBiometric extends StatelessWidget {
  const SubtitleBiometric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Use touch Id to get faster and\nsecure access to your account',
      style: Poppins.regular().s14,
    );
  }
}
