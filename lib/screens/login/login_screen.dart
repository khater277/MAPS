import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/cubit/maps_cubit.dart';
import 'package:maps/cubit/maps_states.dart';
import 'package:maps/screens/login/login_items.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapsCubit,MapsStates>(
      listener: (context,state){},
      builder: (context,state){
        return SafeArea(
            child:
            Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginHead(),
                      const SizedBox(height: 110,),
                      CountryAndPhone(phoneController: _phoneController,),
                      const SizedBox(height: 70,),
                      const NextButton()
                    ],
                  ),
                ),
              ),
            )
        );
      },
    );
  }
}
