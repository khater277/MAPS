import 'package:flutter/material.dart';
import 'package:maps/screens/otp/otp_items/otp_filed.dart';
import 'package:maps/screens/otp/otp_items/otp_head.dart';
import 'package:maps/screens/otp/otp_items/verify_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                OtpHead(),
                SizedBox(height: 50,),
                OtpFiled(),
                SizedBox(height: 80,),
                VerifyButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
