import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:uuid/uuid.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
 
  final userId = const Uuid().v1();
  StreamSubscription<Position>? positionStream;

  FirebaseFirestore db = FirebaseFirestore.instance;

  LocationBloc() : super(const LocationState()) {

    on<OnStartFollowinUser>((event, emit) => emit( state.copyWith(followingUser: true)));

    on<OnStopFollowinUser>((event, emit) => emit( state.copyWith(followingUser: false)));

    on<OnNewUserLocationEvent>((event, emit) {

      emit(
        state.copyWith(
          lastKnowPosition: event.newLocation,
          myLocationHistory: [ ...state.myLocationHistory, event.newLocation]
        )
      );
     });
  }

  Future getCurrentPosition() async {
   final position = await Geolocator.getCurrentPosition();
  }

  void startFollowingUser(){  
    
    add(OnStartFollowinUser());

    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event ;
      
      add(OnNewUserLocationEvent(LatLng( position.latitude, position.longitude)));
      
      FirebaseFirestore.instance
      .collection("coordenadas")
      .doc(userId).set({
        'lat': position.latitude,
        'lng': position.longitude,
      });
    });
  }

  void stopFollowinUser(){
    positionStream?.cancel();
    add(OnStopFollowinUser());
    FirebaseFirestore.instance
      .collection("coordenadas")
      .doc(userId)
      .delete();
  }

  @override 
  Future<void> close(){
    stopFollowinUser();
    return super.close();
  }
}
