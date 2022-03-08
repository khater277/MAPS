import 'package:flutter/material.dart';
import 'package:maps/screens/login/login_items/country_info.dart';
import 'package:maps/screens/login/login_items/phone_info.dart';

class CountryAndPhone extends StatelessWidget {
  final TextEditingController phoneController;
  const CountryAndPhone({Key? key, required this.phoneController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        const CountryInfo(),
        const SizedBox(width: 8,),
        PhoneInfo(phoneController: phoneController),
      ],
    );
  }
}
