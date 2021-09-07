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
class RidelistViewmodel extends Viewmodel {
  User _user;
  Location _location;
  List<Ride> rides;
  List<User> users;
  List<Location> rideLocation;
  Location _pickupLocation;
  Location _destinationLocation;
  Ride _ride;
  int _selected;


  get ride => _ride;
  get user => _user;
  get pickupLocation => _pickupLocation;
  get destinationLocation => _destinationLocation;

  Location get location => _location;
  set location(Location location) {
    _location = location;
    getList();
  }


  RidelistViewmodel();
  RideService get dataService => dependency();
  UserService get userDataService => dependency();
  LocationService get locationDataService => dependency();

  Future<void> getList() async {
    if (location == null) return;
    turnBusy();
    rides = await dataService.getRideList(destination: location.id);
    users = await userDataService.getUserList();
    rideLocation = await locationDataService.getLocationList();
    turnIdle();
  }
  

  Future<User> getUser(int userId) async {
    return _user = await userDataService.getUser(userId: userId);
  }

  void selectRide(Ride ride) {
    _ride = ride;
    turnIdle();
  }
}
