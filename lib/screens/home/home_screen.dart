import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:maps/cubit/app/maps_cubit.dart';
import 'package:maps/cubit/app/maps_states.dart';
import 'package:maps/screens/login/login_screen.dart';
import 'package:maps/shared/default_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapsCubit,MapsStates>(
      listener: (context,state){
        if(state is MapsLogoutState){
          Get.offAll(()=>const LoginScreen());
        }
      },
      builder: (context,state){
        return Scaffold(
          body: Center(
            child: DefaultElevatedButton(
                child:const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.black,
                rounded: 4,
                height: 45,
                width: 80,
                onPressed: () {
                  MapsCubit.get(context).logOut();
                }),
          ),
        );
      },
    );
  }
}
