import 'package:card91_plugin/card91_flutter_library.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OnBoardingKYC extends StatefulWidget {
  const OnBoardingKYC({Key? key}) : super(key: key);

  @override
  State<OnBoardingKYC> createState() => _OnBoardingKYCState();
}

class _OnBoardingKYCState extends State<OnBoardingKYC> {
  String env = "PROD_SANDBOX";
  String templateId = "yolo";
  String mobile = Hive.box('db').get('phoneNumber');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CardKYCFunction(
                env: env,
                template: templateId,
                mobile: mobile,
                onDataResponse: (String dataResponse) {
                  switch (dataResponse) {
                    case "C91_MIN_KYC_INITIALISED":
                      // Do something to indicate that library is initialized
                      break;
                    case "C91_MIN_KYC_SUCCESS":
                      // Do something to indicate that the API calls have succeeded
                      break;
                    case "C91_MIN_KYC_API_FAILURE":
                      // Do something to indicate that the API calls have failed
                      break;
                    case "C91_MIN_KYC_AUTHENTICATION_FAILURE":
                      // Do something to indicate that the API calls have Unauthorized
                      break;
                    case "C91_MIN_KYC_SERVER_FAILURE":
                      // Do something to indicate that the API calls have Server Error
                      break;
                    case 'C91_ISSUE_CARD_API_FAILURE':
                      // Do something to indicate that the API calls have failed
                      break;
                    case "C91_MIN_KYC_MISSING_PARAMETER":
                      // Do something to indicate that Parameter is missing
                      break;
                    case "C91_MIN_KYC_OTP_SEND_FAIL":
                      // Do something to indicate that the API fails to send the OTP
                      break;
                    case "C91_MIN_KYC_OTP_VERIFICATION_FAIL":
                      // Do something to indicate that the API MIN KYC Verification is failed
                      break;
                    case 'C91_MIN_KYC_MOBILE_ALREADY_EXIST_OR_INVALID':
                    // Do something to indicate that the KYC already done or mobile number invalid
                    // Check the payload to identify the two cases here
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
