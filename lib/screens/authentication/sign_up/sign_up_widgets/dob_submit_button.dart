import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';

class DOBSubmitButton extends StatelessWidget {
  const DOBSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthViewModel>().submitDOB(context);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.blackFont,
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}