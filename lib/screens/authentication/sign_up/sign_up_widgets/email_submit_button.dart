import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';

class EmailSubmitButton extends StatelessWidget {
  const EmailSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AuthViewModel>().submitEmail(context);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 35,
          width: 35,
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
