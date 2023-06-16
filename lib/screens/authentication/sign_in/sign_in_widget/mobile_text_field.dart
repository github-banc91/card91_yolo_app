import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yolo/screens/authentication/auth_view_model.dart';
import 'package:yolo/utils/typography.dart';

class MobileTextField extends StatelessWidget {
  const MobileTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: context.read<AuthViewModel>().loginPhoneController,
        style: Poppins.semiBold().s20,
        decoration: InputDecoration(
          hintText: '',
          hintStyle: Poppins.medium().s16,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              '+91',
              style: Poppins.semiBold().s20,
            ),
          ),
        ),
      ),
    );
  }
}
