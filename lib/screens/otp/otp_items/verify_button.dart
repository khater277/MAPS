import 'package:flutter/material.dart';
import 'package:maps/shared/default_widgets.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: DefaultElevatedButton(
          child: const Text(
            "Verify",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
          color: Colors.black,
          rounded: 4,
          height: 45,
          width: 80,
          onPressed: (){}
      ),
    );
  }
}
