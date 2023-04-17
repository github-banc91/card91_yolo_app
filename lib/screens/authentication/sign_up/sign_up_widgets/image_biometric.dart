import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageBiometric extends StatelessWidget {
  const ImageBiometric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/mdi_scan-helper.svg');
  }
}
