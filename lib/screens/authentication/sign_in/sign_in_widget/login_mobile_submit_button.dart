import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class LoginMobileSubmitButton extends StatelessWidget {
  const LoginMobileSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 50,
          width: size(context).width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            color: AppColors.appTheme,
          ),
          padding: const EdgeInsets.all(5),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get OTP',
                style: Poppins.medium(AppColors.whiteColor).s18,
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
