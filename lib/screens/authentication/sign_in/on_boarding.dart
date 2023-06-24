
import 'package:card91_plugin/card91_flutter_library.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final Card91Controller _controller = Card91Controller();
  String env = "PROD_SANDBOX";
  String templateId = "ypay";
  String cardProgramId = "230528190350397ID1CP9723194";
  String organizationId = "230526135544169ID1OID4070270";
  String uniqueId = "string";
  String authUrl = "https://test.ypay.tech/card91auth/authToken";
  String cardMode = "DIGITAL_ONLY_CARD";
  String customFields =
      "{\"step1\":[{\"name\":\"full name\",\"displayText\":\"Perfect, May I know your name?\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"\"}}],\"step2\":[{\"name\":\"email\",\"displayText\":\"Hi..! Please tell me your email\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"\"}}],\"step3\":[{\"name\":\"DOB\",\"displayText\":\"Perfect..! Please go ahead with your Date of Birth\",\"elements\":{\"type\":\"text\",\"defaultValue\":\"\"}}]}";
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
        child: Container(
          color: Colors.black12,
          child: Column(
            children: [
              IssueCards(
                env: env,
                templateId: templateId,
                cardProgramId: cardProgramId,
                organizationId: organizationId,
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

              // const SponsoredWidget(),
            ],
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
