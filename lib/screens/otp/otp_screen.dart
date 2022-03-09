import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/cubit/login/login_states.dart';
import 'package:maps/screens/otp/otp_items/otp_filed.dart';
import 'package:maps/screens/otp/otp_items/otp_head.dart';
import 'package:maps/screens/otp/otp_items/verify_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){},
      builder: (context,state){
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OtpHead(),
                    const SizedBox(height: 50,),
                    const OtpFiled(),
                    const SizedBox(height: 80,),
                    VerifyButton(state: state,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
