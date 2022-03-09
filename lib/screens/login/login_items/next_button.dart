import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/cubit/app/maps_cubit.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/cubit/login/login_states.dart';
import 'package:maps/screens/otp/otp_screen.dart';
import 'package:maps/shared/default_widgets.dart';


class NextButton extends StatelessWidget {
  final LoginStates state;
  final String phoneNumber;
  const NextButton({Key? key, required this.phoneNumber, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: DefaultElevatedButton(
          child: state is! LoginLoadingState?
          const Text(
            "Next",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          )
        :const DefaultButtonLoader(size: 20, width: 2, color: Colors.white),
          color: Colors.black,
          rounded: 4,
          height: 45,
          width: 80,
          onPressed: (){
            if(LoginCubit.get(context).phoneTextFieldValidate==false){
              showSnackBar(text: LoginCubit.get(context).validationMsg,context: context);
            }else{
              LoginCubit.get(context).phoneAuth(phoneNumber: phoneNumber);
            }
          }
      ),
    );
  }
}
