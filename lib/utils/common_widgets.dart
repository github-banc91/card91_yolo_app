import 'package:flutter/cupertino.dart';

SizedBox getSize({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Size size(context) {
  return MediaQuery.of(context).size;
}
