import 'package:architecture_provider/screens/createride/createride_view.dart';
import 'package:architecture_provider/screens/location/location_view.dart';
import 'package:architecture_provider/screens/passenger/passengerScreen_view.dart';
import 'package:architecture_provider/screens/ride/rideScreen_view.dart';
import 'package:architecture_provider/screens/ridelist/ridelist_view.dart';
import 'package:flutter/material.dart';

import '../screens/login/login_view.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/login':
      return LoginScreen.route();
    case '/location' :
      return LocationScreen.route();
    case '/rideList' :
      return RidelistScreen.route();
    case '/ride' :
      return RideScreen.route();
    case '/createride' :
      return CreateRideScreen.route();
    case '/passenger' :
      return PassengerScreen.route();
  }
  return null;
}
