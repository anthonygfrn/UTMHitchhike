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

// The todo list is user-specific
class RideViewmodel extends Viewmodel {
  Ride _ride;
  Ride selectedRide;
  User rideUser;
  User passenger;
  Location pickupLocation;
  Location destinationLocation;


  Ride get ride => _ride;
  set ride(Ride ride) {
    _ride = ride;
    getRide();
  }


  RideViewmodel();
  RideService get dataService => dependency();
  UserService get userDataService => dependency();
  LocationService get locationDataService => dependency();

  Future<void> getRide() async {
    if (ride == null) return;
    turnBusy();
    selectedRide = await dataService.getRide(rideId: ride.id);
    rideUser = await userDataService.getUser(userId: ride.ride);
    passenger = await userDataService.getUser(userId: ride.passenger);
    pickupLocation = await locationDataService.getLocationbyId(locationId: ride.pickup);
    destinationLocation = await locationDataService.getLocationbyId(locationId: ride.destination);
    turnIdle();
  }

  Future<void> joinRide(int passenger) async {
    turnBusy();
    final updatedRide = await dataService.updatePassenger(id: ride.id, passenger: passenger);
    ride = updatedRide;
    turnIdle();
  }
}
