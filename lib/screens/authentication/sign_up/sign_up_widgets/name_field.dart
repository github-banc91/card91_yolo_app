import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/typography.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: context.read<AuthViewModel>().signUpName,
      style: Poppins.semiBold().s20,
      decoration: InputDecoration(
        hintText: '',
        hintStyle: Poppins.medium().s16,
      ),
    );
  }
}
