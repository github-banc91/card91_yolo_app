import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

class ViewModel extends ChangeNotifier {
  bool _isLoading = false;

  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  get isLoading => _isLoading;

  ///error message for showing in snackBar
  String? snackBarText;
  VoidCallback? onError;

  void callApi(AsyncCallback api) {
    isLoading = true;
    notifyListeners();
    api().then((_) {
      isLoading = false;
      notifyListeners();
    }).catchError((th) {
      debugPrint("Caught Error while calling api: $th");
      debugPrint("Type of Exception: ${th.runtimeType}");

      snackBarText =
          "translate.Something went wrong, Please try again later".tr();
      onError?.call();
      isLoading = false;
      notifyListeners();
    });
  }
}
