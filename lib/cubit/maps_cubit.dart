import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/cubit/maps_states.dart';

class MapsCubit extends Cubit<MapsStates>{
  MapsCubit() : super(AppInitialState());
  static MapsCubit get(context)=>BlocProvider.of(context);

  bool phoneTextFieldValidate = false;
  String validationMsg = "please enter your phone number!";
  void phoneValidation({
    @required String? phone,
  }){

    List<String> validNumbers = ["010","011","012","015"];

    if(phone!.isEmpty) {
      phoneTextFieldValidate = false;
      validationMsg = "please enter your phone number !";
    }else{
      if(phone.length<11){
        phoneTextFieldValidate=false;
        validationMsg = "too short for a phone number";
      }else if(phone.length>11){
        phoneTextFieldValidate=false;
        validationMsg = "too long for a phone number";
      }else {
        if(validNumbers.contains(phone.substring(0,3))) {
          phoneTextFieldValidate=true;
        }else{
          phoneTextFieldValidate=false;
          validationMsg = "wrong phone number";
        }
      }
    }
    print(phoneTextFieldValidate);
    emit(SignUpPhoneValidationState());
  }


}