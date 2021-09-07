import 'package:architecture_provider/models/ride.dart';
import 'package:architecture_provider/models/user.dart';
import 'package:architecture_provider/services/location/location_service.dart';
import 'package:architecture_provider/services/ride/ride_service.dart';
import 'package:architecture_provider/services/user/user_service.dart';

import '../../app/dependencies.dart';

import '../../services/ride/ride_service.dart';
import '../../models/ride.dart';
import '../../models/location.dart';
import '../viewmodel.dart';

class PassengerViewmodel extends Viewmodel {
  Ride _ride;
  Ride createdRide;
  User rideUser;
  User passenger;
  List<User> users;
  Location pickupLocation;
  Location destinationLocation;
  String passengerName = "No Passenger";
  String passengerAvatar = "";


  Ride get ride => _ride;
  set ride(Ride ride) {
    _ride = ride;
    getRide();
  }

  PassengerViewmodel();
  RideService get dataService => dependency();
  UserService get userDataService => dependency();
  LocationService get locationDataService => dependency();

  Future<void> getRide() async {
    if (ride == null) return;
    turnBusy();
    createdRide = await dataService.getRide(rideId: ride.id);
    if(ride.passenger != 0){
      passenger = await userDataService.getUser(userId: ride.passenger);
      passengerName = passenger.name;
      passengerAvatar = passenger.avatar;
    }
    pickupLocation = await locationDataService.getLocationbyId(locationId: ride.pickup);
    destinationLocation = await locationDataService.getLocationbyId(locationId: ride.destination);
    // passenger = await userDataService.getUser(userId: ride.passenger);
    // users = await userDataService.getUserList();
    turnIdle();
  }

  Future<void> getMockRide() async {
    turnBusy();
    createdRide = await dataService.getRide(rideId: 1);
    turnIdle();
  }

  // void retrieveRide(Ride ride) async {
  //   turnBusy();
    
    
  //   turnIdle();
  // }

  Future<void> checkPassenger() async {
    turnBusy();
    createdRide = createdRide = await dataService.getRide(rideId: ride.id);
    ride = createdRide;
    turnIdle();
  }

  Future<void> retrieveUser(int id) async {
    return passenger = await userDataService.getUser(userId: id);
  }
}
