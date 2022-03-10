import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/cubit/login/login_states.dart';
import 'package:maps/screens/home/home_screen.dart';
import 'package:maps/screens/otp/otp_items/otp_filed.dart';
import 'package:maps/screens/otp/otp_items/otp_head.dart';
import 'package:maps/screens/otp/otp_items/verify_button.dart';
import 'package:maps/shared/default_widgets.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        if(state is LoginSubmitOtpState){
          GetStorage().write('loggedIn', true).then((value){
            Get.to(()=>const HomeScreen());
          });
        }
        if(state is LoginErrorState){
          showSnackBar(text: state.error, context: context);
        }
      },
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
                    OtpHead(phoneNumber: phoneNumber,),
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
