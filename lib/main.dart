import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/cubit/maps_cubit.dart';
import 'package:maps/cubit/maps_states.dart';
import 'package:maps/screens/login/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>MapsCubit(),)
      ],
      child: BlocConsumer<MapsCubit,MapsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
            theme: ThemeData(),
          );
        },
      ),);
  }
}
