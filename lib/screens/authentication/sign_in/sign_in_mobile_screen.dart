import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yolo/providers/access_key_provider.dart';
import 'package:yolo/providers/mobile_login_provider.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/common_card_view.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/login_with_phone.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/logo_widget.dart';
import 'package:yolo/screens/authentication/sign_in/sign_in_widget/welcome_widget.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/utils/common_widgets.dart';
import 'package:yolo/utils/network_utils.dart';
import 'package:yolo/utils/typography.dart';

class SignInMobileScreen extends ConsumerStatefulWidget {
  const SignInMobileScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignInMobileScreenState();
}

class _SignInMobileScreenState extends ConsumerState<SignInMobileScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    ref.read(accessKeyProvider);
  }

  @override
  Widget build(BuildContext context) {
    final mobileWatch = ref.watch(mobileLoginStatusProvider);
    return Scaffold(
      backgroundColor: AppColors.appTheme,
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CommonCardView(
            child: Column(
              children: [
                getSize(height: 15),
                const LogoWidget(),
                getSize(height: 50),
                const WelcomeWidget(),
                getSize(height: 25),
                const LogInWithPhoneNumber(),
                getSize(height: 45),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    style: Poppins.semiBold().s20,
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: Poppins.medium().s16,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          '+91',
                          style: Poppins.semiBold().s20,
                        ),
                      ),
                    ),
                    maxLength: 10,
                  ),
                ),
                getSize(height: 25),
                mobileWatch
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.redError,
                        ),
                      )
                    : ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          if (phoneNumberController.text.isNotEmpty) {
                            ref.read(mobileLoginStatusProvider.notifier).state =
                                true;

                            requestBody = {
                              'mobile_number': "91${phoneNumberController.text}"
                            };
                            ref.read(mobileloginProvider).then((value) {
                              print(
                                  " mobile_number 91${phoneNumberController.text}");
                              print(
                                  "value['mpinExists'] ${value['mpinExists']}");
                              if (value['mpinExists'] == true) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  'SignInMpinFingerprintScreen',
                                  (Route<dynamic> route) => true,
                                );
                              } else if (value['message'] ==
                                  "CardHolder not found") {
                                Navigator.pushNamed(context, 'OnBoarding');
                              } else {
                                showToast(value['message'], AppColors.redError);
                              }
                            });
                          } else {
                            showToast(
                                'please enter your registered mobile number',
                                AppColors.redError);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: size(context).width * 0.65,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(80),
                          //   color: AppColors.blackFont,
                          // ),
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Text(
                            'LogIn',
                            style: RedHat.bold(AppColors.whiteColor).s20,
                          ),
                        ),
                      ),
                // getSize(height: 20),
                // InkWell(
                //   onTap: () {
                //     //print("hello moto");
                //   },
                //   child: const SizedBox(
                //     height: 40,
                //     child: FingerPrintLoginOption(),
                //   ),
                // ),
                getSize(height: 20),
              ],
            ),
          ),
          Image.asset(
            'assets/images/rocket.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
