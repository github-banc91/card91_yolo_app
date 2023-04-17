import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';

class OTPFields extends StatelessWidget {
  const OTPFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteBgColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyCard,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: context.read<AuthViewModel>().loginOtp1,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, top: 5),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),
          getSize(width: 5),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteBgColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyCard,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: context.read<AuthViewModel>().loginOtp2,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, top: 5),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          getSize(width: 5),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteBgColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyCard,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: context.read<AuthViewModel>().loginOtp3,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, top: 5),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                } else {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
          getSize(width: 5),
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteBgColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyCard,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: context.read<AuthViewModel>().loginOtp4,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 20, top: 5),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                if (value.length == 1) {
                } else {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
