import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

SizedBox getSize({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Size size(context) {
  return MediaQuery.of(context).size;
}

showToast(msz, Color getColor) {
  return Fluttertoast.showToast(
    msg: msz.toString(),
    toastLength: Toast.LENGTH_SHORT,
    textColor: Colors.white,
    backgroundColor: getColor,
  );
}
