import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:maps/cubit/app/maps_cubit.dart';
import 'package:maps/cubit/app/maps_states.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/firebase_options.dart';
import 'package:maps/screens/login/login_screen.dart';
import 'package:maps/styles/themes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>MapsCubit(),),
        BlocProvider(create: (BuildContext context)=>LoginCubit(),)
      ],
      child: BlocConsumer<MapsCubit,MapsStates>(
        listener: (context,state){},
        builder: (context,state){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
            theme: lightTheme,
          );
        },
      ),);
  }
}
