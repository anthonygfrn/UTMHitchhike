import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view.dart';
import 'ridelist_viewmodel.dart';
import '../location/location_viewmodel.dart';
import '../../app/dependencies.dart';
import 'widgets/appbar_view.dart';
import 'widgets/ride_view.dart';

class RidelistScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => RidelistScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(),
      body: View<RidelistViewmodel>(
        initViewmodel: (ridelistViewmodel) =>
            ridelistViewmodel.location = dependency<LocationViewmodel>().location,
        builder: (context, ridelistViewmodel, __) {
          print('-' * 20);

          final rides = ridelistViewmodel.rides;
          

          return ListView.separated(
            itemCount: rides.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (context, index) => RideView(index: index),
          );
        },
      ),
    );
  }
}
