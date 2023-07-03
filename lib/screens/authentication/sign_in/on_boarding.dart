import 'package:flutter/material.dart';
import 'package:yolo/utils/constants.dart';

import 'issue_car.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final Card91Controller _controller = Card91Controller();
  String env = "PROD_SANDBOX";
  String templateId = "yolo";
  String uniqueId = "string";
  String authUrl = "https://integrations.card91.io/api:Srfx-bxR/auth/token?x-data-source=test";
  String cardMode = "DIGITAL_ONLY_CARD";
  String customFields =
      "{\"step1\":[{\"name\":\"fullName\",\"displayText\":\"Perfect, May I know your name?\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"\"}},{\"name\":\"mobile\",\"displayText\":\"\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"913636363636\"}}],\"step2\":[{\"name\":\"email\",\"displayText\":\"Hi..! Please tell me your email\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"\"}}],\"step3\":[{\"name\":\"nameOnCard\",\"displayText\":\"Perfect..! Please go ahead with your name on card.\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"\"}}]}";
  int _currentFunctionIndex = 0;
  @override
  void initState() {
    print('Onboarding screen initialised');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Colors.black12,
            child: Column(
              children: [
                IssueCards(
                  env: env,
                  templateId: templateId,
                  cardProgramId: cardProgramId,
                  organizationId: orgId,
                  uniqueId: uniqueId,
                  authUrl: authUrl,
                  cardMode: cardMode,
                  customFields: customFields,
                  card91controller: _controller,
                  onDataResponse: (String dataResponse) {
                    print("data - $dataResponse");
                    switch (dataResponse) {
                      case "C91_ISSUE_CARD_SCREEN_INITIALISED":
                        // Do something to indicate that Parameter is missing
                        break;
                      case "C91_ISSUE_CARD_AUTHENTICATION_FAILURE":
                        // Do something to indicate that the API calls have Unauthorized
                        break;
                      case "C91_ISSUE_CARD_SERVER_FAILURE":
                        // Do something to indicate that the API calls have Server Error
                        break;
                      case "C91_ISSUE_CARD_SCREEN_SUCCESS":
                        Navigator.pushNamed(context, "AddReferralScreen");
                        // Do something to indicate that the API calls have succeeded
                        break;
                      case "C91_ISSUE_CARD_MISSING_PARAMETER":
                        // Do something to indicate that the API calls have succeeded
                        break;
                      case 'C91_ISSUE_CARD_API_FAILURE':
                        // Do something to indicate that the API calls have failed
                        break;
                      case "C91_ISSUE_CARD_EXTERNAL_AUTHENTICATION_FAILURE":
                        // Do something to indicate that the API calls have Unauthorized
                        break;
                      case "C91_ISSUE_CARD_EXTERNAL_SERVER_FAILURE":
                        // Do something to indicate that the API calls have Server Error
                        break;
                      case "C91_ISSUE_CARD_TOKEN_API_SUCCESS":
                        // Do something to indicate that the API calls have succeeded
                        break;
                      case 'C91_ISSUE_CARD_TOKEN_API_FAILURE':
                        // Do something to indicate that the API calls have failed
                        break;
                      case 'C91_ISSUE_CARD_EXTERNAL_MISSING_PARAMETER':
                        // Do something to indicate that the API calls have failed
                        break;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        _currentFunctionIndex++;
        if (_currentFunctionIndex == 1) {
          _controller.callStep!("step2");
        } else if (_currentFunctionIndex == 2) {
          _controller.callStep!("step3");
        } else if (_currentFunctionIndex == 3) {
          _controller.callStep!("submit");
        }
      }),
    );
  }
}
