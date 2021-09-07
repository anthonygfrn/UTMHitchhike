import 'package:architecture_provider/screens/createride/createride_viewmodel.dart';
import 'package:architecture_provider/screens/location/location_viewmodel.dart';
import 'package:architecture_provider/screens/passenger/passengerScreen_viewmodel.dart';
import 'package:architecture_provider/screens/ride/rideScreen_viewmodel.dart';
import 'package:architecture_provider/screens/ridelist/ridelist_viewmodel.dart';
import 'package:architecture_provider/services/location/location_service.dart';
import 'package:architecture_provider/services/location/location_service_rest.dart';
import 'package:architecture_provider/services/ride/ride_service.dart';
import 'package:architecture_provider/services/ride/ride_service_rest.dart';
// import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../services/rest_service.dart';
import '../services/user/user_service.dart';
import '../services/user/user_service_rest.dart';
import '../screens/login/login_viewmodel.dart';

GetIt dependency = GetIt.instance;

void init() {
  // Services
  dependency.registerLazySingleton(() => RestService());
  dependency.registerLazySingleton<UserService>(() => UserServiceRest());
  dependency.registerLazySingleton<RideService>(() => RideServiceRest());
  dependency.registerLazySingleton<LocationService>(() => LocationServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => LoginViewmodel());
  dependency.registerLazySingleton(() => LocationViewmodel());
  dependency.registerLazySingleton(() => RidelistViewmodel());
  dependency.registerLazySingleton(() => RideViewmodel());
  dependency.registerLazySingleton(() => CreateRideViewmodel());
  dependency.registerLazySingleton(() => PassengerViewmodel());
}
