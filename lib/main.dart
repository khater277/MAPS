// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maps/cubit/app/bloc_observer.dart';
import 'package:maps/cubit/app/maps_cubit.dart';
import 'package:maps/cubit/app/maps_states.dart';
import 'package:maps/cubit/login/login_cubit.dart';
import 'package:maps/firebase_options.dart';
import 'package:maps/screens/home/home_screen.dart';
import 'package:maps/screens/login/login_screen.dart';
import 'package:maps/styles/themes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget? homeWidget;
  bool? loggedIn = GetStorage().read('loggedIn');
  print("loggedIn============> $loggedIn");
  if(loggedIn==true){
    homeWidget = const HomeScreen();
  }else{
    homeWidget = const LoginScreen();
  }
  runApp(MyApp(homeWidget: homeWidget,));
}

class MyApp extends StatelessWidget {
  final Widget homeWidget;
  const MyApp({Key? key, required this.homeWidget}) : super(key: key);

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
            home: homeWidget,
            theme: lightTheme,
          );
        },
      ),);
  }
}
