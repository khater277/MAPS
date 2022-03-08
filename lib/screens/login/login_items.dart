import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maps/cubit/maps_cubit.dart';
import 'package:maps/shared/constant.dart';
import 'package:maps/shared/default_widgets.dart';
import 'package:maps/styles/icons_broken.dart';

class LoginHead extends StatelessWidget {
  const LoginHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What is your phone number?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 30,),
        Text(
          "please enter your phone number to verify your account",
          style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600
              //fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }
}

class CountryInfo extends StatelessWidget {
  const CountryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String countryFlag(){
      String countryCode = 'eg';
      String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
              (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
      return flag;
    }

    return Expanded(
      flex: 1,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: lightGrey),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text("${countryFlag()}  +20",
            style: const TextStyle(
                fontSize: 16
            ),),
        ),
      ),
    );
  }
}

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
        rounded: 4,
        inputType: TextInputType.phone,
        onChanged: (value){
          MapsCubit.get(context).phoneValidation(phone: phoneController.text);
        },
      ),
      // child: DefaultTextFiled(
      //   controller: phoneController,
      //     hint: "",
      //     hintSize: 0,
      //     height: 15,
      //     suffix: const SizedBox(width: 0,),
      //     focusBorder: blue,
      //     border: blue,
      //     inputType: TextInputType.phone,
      //     rounded: 4,
      // ),
      /////////////////////////////////////
      // child: TextFormField(
      //   autofocus: true,
      //   controller: phoneController,
      //   cursorColor: Colors.black,
      //   decoration: const InputDecoration(border: InputBorder.none),
      //   style: const TextStyle(
      //       fontSize: 16,
      //       letterSpacing: 2
      //   ),
      //   keyboardType: TextInputType.phone,
      //   validator: (value){
      //     if(value!.isEmpty){
      //       return "please enter your phone number!";
      //     }else if(value.length<11){
      //       return "too short for a phone number";
      //     }else if(value.length>11){
      //       return "too long for a phone number";
      //     }
      //     return null;
      //   },
      // ),
    );
  }
}

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

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: DefaultElevatedButton(
          child: const Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          color: Colors.black,
          rounded: 4,
          height: 45,
          width: 80,
          onPressed: (){

            //showSnackBar();
            if(MapsCubit.get(context).phoneTextFieldValidate==false){
              buildFlushBar(
                  color: Colors.black,
                  message: MapsCubit.get(context).validationMsg,
                  messageColor: Colors.white,
                  duration: 2,
                  context: context,
                  position: FlushbarPosition.BOTTOM,
                  icon: IconBroken.Danger
              );
              //showSnackBar(MapsCubit.get(context).validationMsg);
            }
          }
      ),
    );
  }
}
