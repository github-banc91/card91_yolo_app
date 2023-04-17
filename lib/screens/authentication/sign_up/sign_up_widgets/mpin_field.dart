import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class MPINField extends StatelessWidget {
  const MPINField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PIN CODE',
          style: Poppins.regular().s18,
        ),
        getSize(height: 15),
        pinField(context),
        getSize(height: 30),
        Text(
          'CONFIRM CODE',
          style: Poppins.regular().s18,
        ),
        getSize(height: 15),
        confirmPinField(context),
      ],
    );
  }

  Widget pinField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().pin1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().pin2,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().pin3,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().pin4,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().pin5,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
      ],
    );
  }

  Widget confirmPinField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().confirmPin1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().confirmPin2,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().confirmPin3,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().confirmPin4,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
        SizedBox(
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            controller: context.read<AuthViewModel>().confirmPin5,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.greyCard,
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
      ],
    );
  }
}
