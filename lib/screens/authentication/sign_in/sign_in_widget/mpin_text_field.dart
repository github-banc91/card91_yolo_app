import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/typography.dart';

class MPINTextField extends StatelessWidget {
  const MPINTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<AuthViewModel>().loginMPINController,
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
