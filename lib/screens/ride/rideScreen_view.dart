import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view.dart';
import 'rideScreen_viewmodel.dart';
import '../../app/dependencies.dart';
import '../ridelist/ridelist_viewmodel.dart';
import 'widgets/appbar_view.dart';
import 'widgets/ride_view.dart';

class RideScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => RideScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(),
      body: View<RideViewmodel>(
        initViewmodel: (rideViewmodel) =>
            rideViewmodel.ride = dependency<RidelistViewmodel>().ride,
        builder: (context, rideViewmodel, __) {
          print('-' * 20);

          final ride = rideViewmodel.selectedRide;

          return Scaffold(
            body: RideView(ride: ride),
          );
        },
      ),
    );
  }
}
