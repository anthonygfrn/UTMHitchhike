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

class CreateRideViewmodel extends Viewmodel {
  User _user;
  List<Location> locations;
  String pickup;
  String destination;
  Location pickupLocation;
  Location destinationLocation;
  String dep;
  String lic;
  Ride _createdRide;
  Ride newRide;

  get createdRide => _createdRide;
  User get user => _user;
  set user(User user) {
    _user = user;
    getList();
  }

  CreateRideViewmodel();
  LocationService get dataService => dependency();
  RideService get rideDataService => dependency();

  Future<void> getList() async {
    if (user == null) return;
    turnBusy();
    locations = await dataService.getLocationList();
    turnIdle();
  }

  Future<void> selectDestination(String des) async {
    destination = des;
    destinationLocation = await dataService.getLocationbyName(locationName: des);
    turnIdle();
  }

  Future<void> selectPickup(String pic) async {
    pickup = pic;
    pickupLocation = await dataService.getLocationbyName(locationName: pic);
    turnIdle();
  }

  Future<void> addNewRide() async {
    turnBusy();
    final newRide = await rideDataService.createRide(
        ride: Ride(ride: user.id, passenger: 0, pickup: pickupLocation.id, destination: destinationLocation.id, departure: dep, licenseNumber: lic));
    turnIdle();
    turnBusy();
    _createdRide = await rideDataService.getRide(rideId: newRide.id);
    turnIdle();
  }

  
}
