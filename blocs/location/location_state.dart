part of 'location_bloc.dart';

class LocationState extends Equatable {

  final bool followingUser;
  final LatLng? lastKnowPosition;
  final List<LatLng> myLocationHistory;


  const LocationState({
    this.followingUser = false,
    this.lastKnowPosition,
    myLocationHistory
  }): myLocationHistory = myLocationHistory ?? const [];

  LocationState copyWith({
    final bool? followingUser,
    final LatLng? lastKnowPosition,
    final List<LatLng>? myLocationHistory,
  })=> LocationState(
    followingUser: followingUser ?? this.followingUser,
    lastKnowPosition: lastKnowPosition ?? this.lastKnowPosition,
     myLocationHistory: myLocationHistory ?? this.myLocationHistory,
  );
  
  @override
  List<Object?> get props => [followingUser, lastKnowPosition, myLocationHistory];
}


