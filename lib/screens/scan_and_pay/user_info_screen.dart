import 'package:flutter/material.dart';
import 'package:yolo/screens/scan_and_pay/pay_now_screen.dart';
import 'package:yolo/screens/scan_and_pay/scan_and_pay_widgets/user_info_widget.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class UserInfoScreen extends StatefulWidget {
  static const String route = 'UserInfoScreen';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  int isSelect = 0;
  TextEditingController amount = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      amount.text = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      bottomSheet: sendMoneyBtn(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteBgColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.blackFont,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pay to',
          style: Poppins.medium(AppColors.blackFont).s18,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(
          children: [
            const UserInfoWidget(),
            getSize(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available Balance Rs.0',
                style: Poppins.regular(const Color(0xff000000)).s13,
              ),
            ),
            getSize(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter the amount',
                style: Poppins.regular().s15,
              ),
            ),
            getSize(height: 10),
            amountTextField(),
            getSize(height: 40),
            staticAmount(),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/credit card wallet.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget amountTextField() {
    return TextFormField(
      controller: amount,
      style: Poppins.bold().s20,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.greyFont,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget staticAmount() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelect = 1;
                amount.text = '${int.parse(amount.text) + 100}';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelect == 1
                    ? AppColors.blackFont
                    : const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              alignment: Alignment.center,
              child: Text(
                '100',
                style: Poppins.semiBold(
                  isSelect == 1 ? const Color(0xffF0F0F0) : AppColors.blackFont,
                ).s15,
              ),
            ),
          ),
        ),
        getSize(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelect = 2;
                amount.text = '${int.parse(amount.text) + 200}';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelect == 2
                    ? AppColors.blackFont
                    : const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              alignment: Alignment.center,
              child: Text(
                '200',
                style: Poppins.semiBold(
                  isSelect == 2 ? const Color(0xffF0F0F0) : AppColors.blackFont,
                ).s15,
              ),
            ),
          ),
        ),
        getSize(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSelect = 3;
                amount.text = '${int.parse(amount.text) + 500}';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelect == 3
                    ? AppColors.blackFont
                    : const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              alignment: Alignment.center,
              child: Text(
                '500',
                style: Poppins.semiBold(
                  isSelect == 3 ? const Color(0xffF0F0F0) : AppColors.blackFont,
                ).s15,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget sendMoneyBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          PayNowScreen.route,
          arguments: amount.text,
        );
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.fromLTRB(65, 10, 65, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: AppColors.blackFont,
        ),
        alignment: Alignment.center,
        child: Text(
          'Send Money',
          style: Poppins.bold(AppColors.whiteColor).s18,
        ),
      ),
    );
  }
}
