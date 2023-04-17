import 'package:flutter/material.dart';
import 'package:yolo/utils/typography.dart';

class DOBRegisterTitle extends StatelessWidget {
  final String name;
  const DOBRegisterTitle({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perfect $name ! Please go ahead with your',
          style: Poppins.semiBold().s22,
        ),
        Text(
          'Date of Birth',
          style: Poppins.semiBold().s24,
        ),
      ],
    );
  }
}
