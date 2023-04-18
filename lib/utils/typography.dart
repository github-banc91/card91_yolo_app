import 'package:flutter/material.dart';

///Helper class for easily accessing font sizes, colors and families

class Font {
  var _textStyle = const TextStyle();

  TextStyle get s40 => _textStyle.copyWith(fontSize: 40);

  TextStyle get s36 => _textStyle.copyWith(fontSize: 36);

  TextStyle get s32 => _textStyle.copyWith(fontSize: 32);

  TextStyle get s24 => _textStyle.copyWith(fontSize: 24);

  TextStyle get s22 => _textStyle.copyWith(fontSize: 22);

  TextStyle get s20 => _textStyle.copyWith(fontSize: 20);

  TextStyle get s18 => _textStyle.copyWith(fontSize: 18);

  TextStyle get s16 => _textStyle.copyWith(fontSize: 16);

  TextStyle get s15 => _textStyle.copyWith(fontSize: 15);

  TextStyle get s14 => _textStyle.copyWith(fontSize: 14);

  TextStyle get s13 => _textStyle.copyWith(fontSize: 13);

  TextStyle get s12 => _textStyle.copyWith(fontSize: 12);

  TextStyle get s10 => _textStyle.copyWith(fontSize: 10);

  TextStyle get s9 => _textStyle.copyWith(fontSize: 9);
}

class RedHat extends Font {
  RedHat.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'RedHat',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  RedHat.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'RedHat',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  RedHat.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'RedHat',
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }

  RedHat.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'RedHat',
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  RedHat.extraBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'RedHat',
      fontWeight: FontWeight.w800,
      color: color ?? Colors.black,
    );
  }

  RedHat.boldUnderline([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'RedHat',
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
}

class Poppins extends Font {
  Poppins.regular([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins-Regular',
      fontWeight: FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  Poppins.medium([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins-Medium',
      fontWeight: FontWeight.w500,
      color: color ?? Colors.black,
    );
  }

  Poppins.semiBold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins-SemiBold',
      fontWeight: FontWeight.w600,
      color: color ?? Colors.black,
    );
  }
  Poppins.bold([final Color? color]) {
    _textStyle = _textStyle.copyWith(
      fontFamily: 'Poppins-SemiBold',
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );
  }
}
