import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class EmailRegisterTitle extends StatelessWidget {
  final String name;
  const EmailRegisterTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hi $name ! Please tell\nme your email',
      style: Poppins.semiBold().s22,
    );
  }
}
