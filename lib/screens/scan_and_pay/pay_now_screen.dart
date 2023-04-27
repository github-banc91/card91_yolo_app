import 'package:flutter/material.dart';
import 'package:yolo/screens/scan_and_pay/scan_and_pay_widgets/user_info_widget.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class PayNowScreen extends StatefulWidget {
  static const String route = 'PayNowScreen';
  const PayNowScreen({Key? key}) : super(key: key);

  @override
  State<PayNowScreen> createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  @override
  Widget build(BuildContext context) {
    final String amount = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
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
          'Pay',
          style: Poppins.medium(AppColors.blackFont).s18,
        ),
      ),
      bottomSheet: payBtn(amount),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserInfoWidget(),
            getSize(height: 50),
            Text(
              'You are paying',
              style: Poppins.semiBold().s16,
            ),
            getSize(height: 15),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Poppins-SemiBold',
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            getSize(height: 15),
            Text(
              'Rupees Two Hundred Thirty Only ',
              style: Poppins.regular(AppColors.greyFont).s15,
            ),
          ],
        ),
      ),
    );
  }

  Widget payBtn(amount) {
    return Container(
      height: 200,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
        color: AppColors.whiteBgColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyCard,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RuPay from',
            style: Poppins.medium(AppColors.greyFont).s15,
          ),
          ListTile(
            leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.appTheme.withOpacity(0.1),
              ),
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/icons/yolo name.png',
              ),
            ),
            title: Text(
              'YOLO PAY **** **** 9999',
              style: Poppins.medium(AppColors.greyFont).s14,
            ),
            subtitle: Text(
              '9586818752@yolopay',
              style: Poppins.regular(AppColors.greyFont).s13,
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                backgroundColor: AppColors.whiteColor,
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      getSize(height: 45),
                      Image.asset('assets/icons/Vector.png'),
                      getSize(height: 15),
                      Text(
                        'Touch to confirm',
                        style: Poppins.medium().s14,
                      ),
                      getSize(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Use MPIN',
                            style: Poppins.medium().s14,
                          ),
                        ),
                      ),
                      getSize(height: 20),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: AppColors.blackFont,
              ),
              alignment: Alignment.center,
              child: Text(
                'Pay $amount',
                style: Poppins.medium(AppColors.whiteColor).s18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
