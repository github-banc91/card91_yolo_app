import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yolo/screens/scan_and_pay/payment_status_screen.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class MPINForPayScreen extends StatefulWidget {
  static const String route = 'MPINForPayScreen';
  const MPINForPayScreen({Key? key}) : super(key: key);

  @override
  State<MPINForPayScreen> createState() => _MPINForPayScreenState();
}

class _MPINForPayScreenState extends State<MPINForPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: BackButton(
          color: AppColors.blackFont,
        ),
      ),
      bottomSheet: btn(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(35, 20, 35, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSize(height: 40),
            Text(
              'Enter MPIN PIN',
              style: Poppins.semiBold(const Color(
                0xff797CE5,
              )).s20,
            ),
            getSize(height: 40),
            pinField(),
          ],
        ),
      ),
    );
  }

  Widget pinField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
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
          padding: const EdgeInsets.all(2),
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.whiteColor,
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
        Container(
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
          padding: const EdgeInsets.all(2),
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.whiteColor,
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
        Container(
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
          padding: const EdgeInsets.all(2),
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.whiteColor,
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
        Container(
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
          padding: const EdgeInsets.all(2),
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.whiteColor,
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
        Container(
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
          padding: const EdgeInsets.all(2),
          width: 50,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            style: Poppins.semiBold().s20,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20, top: 5),
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.whiteColor,
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

  Widget btn() {
    return Container(
      padding: const EdgeInsets.only(right: 25, bottom: 25),
      child: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, PaymentStatusScreen.route);
          },
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
      ),
    );
  }
}
