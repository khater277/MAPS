import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maps/cubit/app/maps_states.dart';
import 'package:maps/shared/constant.dart';

class MapsCubit extends Cubit<MapsStates>{
  MapsCubit() : super(AppInitialState());
  static MapsCubit get(context)=>BlocProvider.of(context);

  void logOut(){
    emit(MapsLoadingState());
    FirebaseAuth.instance.signOut().then((value){
      otp=null;
      GetStorage().remove('loggedIn');
      emit(MapsLogoutState());
    }).catchError((error){
      emit(MapsErrorState(error));
    });
  }
}