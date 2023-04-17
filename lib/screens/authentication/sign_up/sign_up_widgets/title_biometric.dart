import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class TitleBiometric extends StatelessWidget {
  const TitleBiometric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Allow Touch Id',
      style: Poppins.semiBold().s24,
    );
  }
}
