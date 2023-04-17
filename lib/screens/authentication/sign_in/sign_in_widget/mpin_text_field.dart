import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class MPINTextField extends StatelessWidget {
  const MPINTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: 'Enter Your MPIN',
        hintStyle: Poppins.medium().s16,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.blackFont,
            width: 1,
          ),
        ),
      ),
    );
  }
}
