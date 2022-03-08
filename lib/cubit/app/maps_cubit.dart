import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/cubit/app/maps_states.dart';

class MapsCubit extends Cubit<MapsStates>{
  MapsCubit() : super(AppInitialState());
  static MapsCubit get(context)=>BlocProvider.of(context);



}