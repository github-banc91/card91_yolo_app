import 'package:flutter/material.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class PaymentStatusScreen extends StatefulWidget {
  static const String route = 'PaymentStatusScreen';
  const PaymentStatusScreen({Key? key}) : super(key: key);

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSize(height: 70),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff00C773),
              ),
              padding: const EdgeInsets.only(top: 80, bottom: 80),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/success payment.png'),
                  getSize(height: 15),
                  Text(
                    '200',
                    style: Poppins.semiBold(AppColors.whiteColor).s36,
                  ),
                  getSize(height: 15),
                  Text(
                    'Successfully Transferred',
                    style: Poppins.semiBold(AppColors.whiteColor).s24,
                  ),
                ],
              ),
            ),
            getSize(height: 30),
            Text(
              'Transaction ID: ',
              style: Poppins.regular().s18,
            ),
            getSize(height: 10),
            Text(
              '9889845454997',
              style: Poppins.bold().s18,
            ),
            getSize(height: 10),
            Row(
              children: [
                Image.asset('assets/icons/to success icon.png'),
                getSize(width: 10),
                Text(
                  'To',
                  style: Poppins.medium().s16,
                ),
              ],
            ),
            getSize(height: 15),
            userInfo(),
            getSize(height: 15),
            btns()
          ],
        ),
      ),
    );
  }

  Widget userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 5),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://i.pravatar.cc/500',
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/icons/check icon.png',
                ),
              ],
            ),
          ),
          getSize(height: 10),
          Text(
            'Elisa bsd',
            style: Poppins.regular(AppColors.blackFont).s22,
          ),
          getSize(height: 10),
          Text(
            'Acc No : 8u4t3u4i993940',
            style: Poppins.regular(const Color(0xffA5A5A5)).s18,
          ),
          getSize(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: Poppins.regular(const Color(0xffA5A5A5)).s15,
                      ),
                      getSize(width: 8),
                      Image.asset('assets/icons/calender.png')
                    ],
                  ),
                  getSize(height: 5),
                  Text(
                    '14 March 2023',
                    style: Poppins.semiBold().s16,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Time',
                        style: Poppins.regular(const Color(0xffA5A5A5)).s15,
                      ),
                      getSize(width: 8),
                      Image.asset('assets/icons/time.png')
                    ],
                  ),
                  getSize(height: 5),
                  Text(
                    '04:30 pm',
                    style: Poppins.semiBold().s16,
                  ),
                ],
              ),
            ],
          ),
          getSize(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pay again',
                style: Poppins.regular(const Color(0xffA5A5A5)).s20,
              ),
              getSize(width: 8),
              const Icon(
                Icons.rotate_left_outlined,
                size: 25,
                color: Color(0xffA5A5A5),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget btns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_back_ios_new,
          size: 25,
          color: AppColors.blackFont,
        ),
        Container(
          height: 45,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: AppColors.blackFont,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/share.png',
                height: 25,
              ),
              getSize(width: 10),
              Text(
                'Share',
                style: Poppins.medium(AppColors.whiteColor).s18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
