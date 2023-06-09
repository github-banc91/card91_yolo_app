import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:card91_plugin/src/controller_card91.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class IssueCard extends StatefulWidget {
  final String env;
  final String templateId;
  final String cardProgramId;
  final String organizationId;
  final String uniqueId;
  final String authUrl;
  final String cardMode;
  final String customFields;
  final Card91Controller card91controller;
  final Function(String) onDataResponse;

  IssueCard(
      {super.key,
      required this.env,
      required this.templateId,
      required this.cardProgramId,
      required this.organizationId,
      required this.uniqueId,
      required this.authUrl,
      required this.cardMode,
      required this.customFields,
      required this.card91controller,
      required this.onDataResponse});
  @override
  State<IssueCard> createState() => _IssueCardState(card91controller);
}

class _IssueCardState extends State<IssueCard> {
  late String _url;
  final _key = UniqueKey();

  WebViewController? _webViewController;
  String SET_PARAMS = "C91_ISSUE_CARD_SET_PARAMS";
  String INITIALIZED_CARD = "C91_ISSUE_CARD_SCREEN_INITIALISED";
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  _IssueCardState(Card91Controller _controller) {
    _controller.callStep = stepNavigation as void Function(String step)?;
  }

  @override
  void initState() {
    super.initState();
    _url = webViewURL(widget.env, widget.templateId);
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            WebView(
              key: _key,
              backgroundColor: Colors.transparent,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _webViewController = webViewController;
              },
              javascriptChannels: <JavascriptChannel>{
                _toasterJavascriptChannel(context),
              },
              onPageStarted: (String url) {
                print('Page started loading: $url');
              },
            )
          ],
        ));
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: "ReactNativeWebView",
        onMessageReceived: (JavascriptMessage message) {
          if (json.decode(message.message)['type'].toString() ==
              INITIALIZED_CARD) {
            setParamOnWebView();
          }

          print("Payload----->${json.decode(message.message)['payload']}");

          widget
              .onDataResponse(json.decode(message.message)['type'].toString());
        });
  }

  static String get getPlatform {
    if (Platform.isAndroid) {
      return "android";
    } else {
      return "ios";
    }
  }

  static String get getWindow {
    if (Platform.isAndroid) {
      return "document";
    } else {
      return "window";
    }
  }

  String webViewURL(String env, String templateId) {
    switch (env) {
      case "STAGE_SANDBOX":
        return "https://card-webview.sb.stag.card91.in/issue-card?templateId=$templateId&platform=$getPlatform";
      case "STAGE_LIVE":
        return "https://card-webview.stag.card91.in/issue-card?templateId=$templateId&platform=$getPlatform";
      case "PROD_SANDBOX":
        return "https://card-webview-sandbox.card91.io/issue-card?templateId=$templateId&platform=$getPlatform";
      case "PROD":
        return "https://card-webview.card91.io/issue-card?templateId=$templateId&platform=$getPlatform";
      default:
        return "";
    }
  }

  void setParamOnWebView() async {
    String script =
        "(function () {$getWindow.dispatchEvent(new MessageEvent(\"message\",{data: '{\"type\":\"${SET_PARAMS}\",\"payload\":{\"organizationId\":\"${widget.organizationId}\",\"cardMode\":\"${widget.cardMode}\",\"cardProgramId\":\"${widget.cardProgramId}\", \"uniqueId\":\"${widget.uniqueId}\",\"authUrl\":\"${widget.authUrl}\",\"customFields\":${widget.customFields}}}'}));})();";
    print("Page web Message some script = $script");
    await _webViewController?.runJavascript(script.toString());
  }

  void stepNavigation(String step) async {
    String script = "";
    String finalScript = "";
    String payLoad = "null";
    if (step == "submit") {
      script =
          "{data: '{\"type\":\"C91_ISSUE_CARD_SET_SUBMIT\",\"payload\":$payLoad}'}";
    } else {
      script =
          "{data: '{\"type\":\"C91_ISSUE_CARD_SET_FORM_STEP\",\"payload\":{\"step\":\"$step\"}}'}";
    }
    finalScript =
        "(function () {$getWindow.dispatchEvent(new MessageEvent(\"message\",$script));})();";
    //print("Script ------>"+finalScript);
    await _webViewController?.runJavascript(finalScript.toString());
  }
}

class JsonResponseCreateCard {
  String type;
  Payload payload;
  JsonResponseCreateCard({
    required this.type,
    required this.payload,
  });
  factory JsonResponseCreateCard.fromJson(Map<String, dynamic> json) =>
      JsonResponseCreateCard(
        type: json["type"],
        payload: Payload.fromJson(json["payload"]),
      );
  Map<String, dynamic> toJson() => {
        "type": type,
        "payload": payload.toJson(),
      };
}

class Payload {
  String message;
  Payload({
    required this.message,
  });
  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        message: json["message"],
      );
  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

class Card91Controller {
  void Function(String step)? callStep;
}
