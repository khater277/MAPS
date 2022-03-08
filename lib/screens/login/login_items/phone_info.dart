import 'package:flutter/material.dart';
import 'package:maps/cubit/maps_cubit.dart';
import 'package:maps/shared/constant.dart';
import 'package:maps/shared/default_widgets.dart';

class PhoneInfo extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneInfo({Key? key, required this.phoneController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: DefaultTextFiled(
        controller: phoneController,
        validate: true,
        hint: "",
        hintSize: 0,
        height: 15,
        suffix: const Text(""),
        focusBorder: blue,
        border: blue,
        autoFocus: true,
        cursorColor: Colors.black,
        rounded: 4,
        letterSpacing: 2,
        inputType: TextInputType.phone,
        onChanged: (value){
          MapsCubit.get(context).phoneValidation(phone: phoneController.text);
        },
      ),
    );
  }
}

