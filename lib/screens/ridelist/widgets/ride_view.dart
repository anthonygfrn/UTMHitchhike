import 'package:architecture_provider/models/user.dart';
import 'package:architecture_provider/models/location.dart';
import 'package:architecture_provider/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ridelist_viewmodel.dart';
import '../../../app/dependencies.dart';

class RideView extends StatelessWidget {
  final int index;
  RideView({this.index});

  @override
  Widget build(BuildContext context) {
    return View<RidelistViewmodel>(
      builder: (_, __, ___) {
        final ridelistViewmodel = dependency<RidelistViewmodel>();
        final ride = ridelistViewmodel.rides[index];
        final user = ridelistViewmodel.users.firstWhere((element) => element.id == ride.ride);
        final origin = ridelistViewmodel.rideLocation.firstWhere((element) => element.id == ride.pickup);
        final destination = ridelistViewmodel.rideLocation.firstWhere((element) => element.id == ride.destination);
        
        return ListTile(
          leading: Icon(Icons.location_on_rounded),
          title: Text(user.name),
          subtitle: Text('${origin.name} to ${destination.name}'),
          onTap: () {
            ridelistViewmodel.selectRide(ridelistViewmodel.rides[index]);
            Navigator.pushReplacementNamed(context, '/ride');
          },
          onLongPress: () {},
        );
      },
    );
  }
}
