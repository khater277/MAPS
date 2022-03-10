import 'package:flutter/material.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/cubit/login/login_states.dart';
import 'package:maps/shared/constant.dart';
import 'package:maps/shared/default_widgets.dart';

class VerifyButton extends StatelessWidget {
  final LoginStates state;

  const VerifyButton({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: DefaultElevatedButton(
          child: state is! LoginLoadingState
              ? const Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              : const DefaultButtonLoader(
                  size: 20, width: 3, color: Colors.white),
          color: Colors.black,
          rounded: 4,
          height: 45,
          width: 80,
          onPressed: () {
            if (otp!.length == 6) {
              LoginCubit.get(context).submitOtp(otp!);
            } else {
              showSnackBar(text: "wrong code", context: context);
            }
          }),
    );
  }
}
