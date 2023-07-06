import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yolo/utils/app_colors.dart';
import 'package:yolo/screens/widgets/common_widgets.dart';
import 'package:yolo/utils/network.dart';
import 'package:yolo/utils/typography.dart';

final resetMpinProvider = StateProvider.autoDispose((ref) async {
  http.Response response = await NetworkUtils.request(
          endpoint: 'issuance/v1/cardholders/mpin/verify',
          networkRequestType: NetworkRequestType.post,
          baseUrltype: BaseUrl.user,
          body: requestBody,
          headers: {
            'Content-Type': 'application/json',
          },
          protocolType: SSL.https)
      .whenComplete(() =>
          ref.read(resetMpinProviderStatusProvider.notifier).state = false);
  return response;
});

final resetMpinProviderStatusProvider = StateProvider<bool>((ref) {
  return false;
});

class ResetMpin extends ConsumerStatefulWidget {
  const ResetMpin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResetMpinState();
}

class _ResetMpinState extends ConsumerState<ResetMpin> {
  late List<FocusNode> _mpinfocusNodes;
  late List<TextEditingController> _mpincontrollers;
  late List<FocusNode> _confirmMpinfocusNodes;
  late List<TextEditingController> _confirmMpincontrollers;
  bool _proceed = false;
  String _mpinText = "";
  String _confirmMpinText = "";
  @override
  void initState() {
    super.initState();
    _mpincontrollers = List.generate(6, (index) => TextEditingController());
    _mpinfocusNodes = List.generate(6, (index) => FocusNode());
    _confirmMpinfocusNodes = List.generate(6, (index) => FocusNode());
    _confirmMpincontrollers =
        List.generate(6, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var i = 0; i < 6; i++) {
      _mpincontrollers[i].dispose();
      _mpinfocusNodes[i].dispose();
    }

    for (var i = 0; i < 6; i++) {
      _confirmMpinfocusNodes[i].dispose();
      _confirmMpincontrollers[i].dispose();
    }
    super.dispose();
  }

  void _onMpinTextChanged(int index, String value) {
    final text = value.trim();
    if (text.isNotEmpty) {
      if (text.length == 1) {
        if (index < 6) {
          _mpinfocusNodes[index + 1].requestFocus();
        } else {
          // Perform some action when the OTP is entered, e.g., verify the OTP
          print(
              'OTP entered: ${_mpincontrollers.map((controller) => controller.text).join()}');
        }
      } else {
        _mpincontrollers[index].text = text.substring(0, 1);
      }
    }
  }

  void _onConfirmMpinTextChanged(int index, String value) {
    final text = value.trim();
    if (text.isNotEmpty) {
      if (text.length == 1) {
        if (index < 6) {
          _confirmMpinfocusNodes[index + 1].requestFocus();
        } else {
          // Perform some action when the OTP is entered, e.g., verify the OTP
          print(
              'OTP entered: ${_confirmMpincontrollers.map((controller) => controller.text).join()}');
        }
      } else {
        _confirmMpincontrollers[index].text = text.substring(0, 1);
      }
    }
  }

  void _updateProceedStatus() {
    _mpinText = _mpincontrollers.map((controller) => controller.text).join();
    _confirmMpinText =
        _confirmMpincontrollers.map((controller) => controller.text).join();
    setState(() {
      _proceed = _mpinText != "" &&
          _confirmMpinText != "" &&
          _mpinText == _confirmMpinText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mpinWatch = ref.watch(resetMpinProviderStatusProvider);
    return Scaffold(
      backgroundColor: AppColors.whiteBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              "Setup your Mpin code",
              style: Poppins.regular(AppColors.blackFont).s32,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "To setup your MPIN create 6 digit code and confirm it below",
                style:
                    Poppins.regular(AppColors.blackFont.withOpacity(0.7)).s18,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48.0, bottom: 12),
              child: Text(
                "PIN CODE",
                style:
                    Poppins.regular(AppColors.blackFont.withOpacity(0.7)).s18,
                textAlign: TextAlign.left,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: _mpincontrollers[index],
                    focusNode: _mpinfocusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                    onChanged: (text) => _onMpinTextChanged(index, text),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 12),
              child: Text(
                "CONFIRM CODE",
                style:
                    Poppins.regular(AppColors.blackFont.withOpacity(0.7)).s18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: _confirmMpincontrollers[index],
                    focusNode: _confirmMpinfocusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                    onChanged: (text) => _onConfirmMpinTextChanged(index, text),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: mpinWatch
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FloatingActionButton(
              child: const Icon(Icons.arrow_forward),
              onPressed: () {
                _updateProceedStatus();
                ;
                ref.read(resetMpinProviderStatusProvider.notifier).state = true;
                if (_proceed) {
                  requestBody = {
                    "mobile": Hive.box('db').get('phoneNumber'),
                    "mpin": _mpinText,
                    "sessionId": "DUMMY-ID",
                    "otp": "121212"
                  };
                  ref.read(resetMpinProvider).then((value) {
                    Map<String, dynamic> result = jsonDecode(value.body);
                    if (value.statusCode == 200) {
                      Navigator.pushNamed(
                        context,
                        "DashboardScreen",
                      );
                    } else {
                      showToast(result['message'], AppColors.redError);
                    }
                  });
                } else {
                  ref.read(resetMpinProviderStatusProvider.notifier).state =
                      false;

                  showToast(
                      "please enter the mpin properly", AppColors.redError);
                }
              }),
    );
  }
}
