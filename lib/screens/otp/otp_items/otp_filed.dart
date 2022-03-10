// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/shared/constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFiled extends StatefulWidget {
  const OtpFiled({Key? key}) : super(key: key);

  @override
  State<OtpFiled> createState() => _OtpFiledState();
}

class _OtpFiledState extends State<OtpFiled> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      obscureText: false,
      autoFocus: true,
      cursorColor: Colors.black,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeFillColor: Colors.white,
        inactiveColor: blue.withOpacity(0.4),
        activeColor: Colors.grey.withOpacity(0.5),
        selectedFillColor: lightBlue.withOpacity(0.5),
        selectedColor: blue.withOpacity(0.4),
        disabledColor: blue.withOpacity(0.4),
        inactiveFillColor: Colors.white
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (smsCode) {
        LoginCubit.get(context).submitOtp(smsCode);
        setState(() {
          otp = smsCode;
        });
      },
      onChanged: (value) {
        print(value);
      },
    );
  }
}
