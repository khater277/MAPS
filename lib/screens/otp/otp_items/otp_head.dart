import 'package:flutter/material.dart';
import 'package:maps/shared/constant.dart';

class OtpHead extends StatelessWidget {
  const OtpHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Verify your phone number",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 30,),
        RichText(
            text: const TextSpan(
              text: "Enter your 6 digit code number sent to ",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                height: 1.5
              ),
              children: [
                TextSpan(
                  text: "01011677722",
                  style: TextStyle(
                      fontSize: 17,
                      color: blue
                  ),
                )
              ]
            )
        ),
      ],
    );
  }
}
