import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/screens/widgets/common_card_view.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/network.dart';
import 'package:yolo/utils/typography.dart';
import 'package:http/http.dart' as http;

final mobileloginProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint:
              '/issuance/v1/cardholders/${requestBody['mobile_number']}/mpin/status',
          networkRequestType: NetworkRequestType.get,
          baseUrltype: BaseUrl.user,
          headers: {
            'Content-Type': 'application/json',
          },
          protocolType: SSL.https)
      .whenComplete(
          () => ref.read(mobileLoginStatusProvider.notifier).state = false);
  Map<String, dynamic> result = jsonDecode(response.body);
  await Hive.box('db').put('phoneNumber', "${requestBody['mobile_number']}");
  return result;
});

final mobileLoginStatusProvider = StateProvider<bool>((ref) {
  return false;
});

final accessKeyProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
      endpoint: '/api/v1/vendor/login',
      networkRequestType: NetworkRequestType.post,
      baseUrltype: BaseUrl.yolo,
      body: requestBody,
      headers: {
        'Content-Type': 'application/json',
      },
      protocolType: SSL.http);

  Map<String, dynamic> result = jsonDecode(response.body);
  if (response.statusCode == 200) {
    await Hive.box('db').put('accessKey', result['accessKey']);
  }
});

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

  void _signIn() {
    if (phoneNumberController.text.isNotEmpty) {
      ref.read(mobileLoginStatusProvider.notifier).state = true;
      requestBody = {'mobile_number': "91${phoneNumberController.text}"};
      ref.read(mobileloginProvider).then((value) {
        if (value['mpinExists'] == true) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            'SignInMpinFingerprintScreen',
            (Route<dynamic> route) => true,
          );
        } else if (value['message'] == "CardHolder not found") {
          Navigator.pushNamed(context, 'OnBoarding');
        } else {
          showToast(value['message'] ?? value['error'], AppColors.redError);
        }
      });
    } else {
      showToast(
          'please enter your registered mobile number', AppColors.redError);
    }
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
                Text(
                  'YOLO',
                  style: RedHat.extraBold().s24,
                ),
                getSize(height: 50),
                Text(
                  'Welcome back',
                  style: RedHat.bold(AppColors.appTheme).s32.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                getSize(height: 25),
                Text(
                  'Login with Phone Number',
                  style: RedHat.regular().s20,
                ),
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
                          _signIn();
                        },
                        child: Container(
                          height: 50,
                          width: size(context).width * 0.65,
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          child: Text(
                            'LogIn',
                            style: RedHat.bold(AppColors.whiteColor).s20,
                          ),
                        ),
                      ),
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
