import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:yolo/providers/get_referal_code_provider.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/typography.dart';

class ReferUserScreen extends ConsumerStatefulWidget {
  const ReferUserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReferUserScreenState();
}

class _ReferUserScreenState extends ConsumerState<ReferUserScreen> {
  @override
  Widget build(BuildContext context) {
    final referWatch = ref.watch(getReferalCodeProvider);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.greyFont,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            padding: const EdgeInsets.only(top: 230),
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
            child: Column(
              children: [
                Text(
                  'Invites left',
                  style: Poppins.bold(
                    const Color(0xff595959),
                  ).s24,
                ),
                getSize(height: 25),
                Text(
                  'Your referral code',
                  style: Poppins.semiBold(
                    const Color(0xff595959),
                  ).s24,
                ),
                getSize(height: 25),
                referWatch.when(
                    data: (data) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          data['referralCode'] ?? '',
                          style: Poppins.semiBold(
                            const Color(0xff595959),
                          ).s24,
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      String message = '';
                      // if (error is ErrorMessage) {
                      //   message = error.message;
                      // }

                      return Center(
                        child: Text(
                          message,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                    loading: () => const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xFFfa9b6d),
                        ))),
                getSize(height: 25),
                Text(
                  'Refer a friend. Learn More',
                  style: Poppins.semiBold(
                    const Color(0xff595959),
                  ).s13,
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/refer image.png',
          ),
          GestureDetector(
            onTap: () => _onShare(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              margin: const EdgeInsets.only(top: 600),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff213A59),
              ),
              alignment: Alignment.center,
              child: Text(
                'Invite friends',
                style: Poppins.semiBold(
                  AppColors.whiteColor,
                ).s13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onShare() async {
    final box = context.findRenderObject() as RenderBox?;

    // await Share.share(
    //   'This is developer testing',
    //   subject: 'Testing product',
    //   sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    // );
  }
}
