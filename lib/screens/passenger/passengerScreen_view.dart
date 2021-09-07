import 'package:architecture_provider/screens/createride/createride_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view.dart';
import 'passengerScreen_viewmodel.dart';
import '../../app/dependencies.dart';
import '../createride/createride_viewmodel.dart';
import 'widgets/appbar_view.dart';
import 'widgets/passenger_view.dart';

class PassengerScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => PassengerScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(),
      body: View<PassengerViewmodel>(
        initViewmodel: (passengerViewmodel) =>
            passengerViewmodel.ride = dependency<CreateRideViewmodel>().createdRide,
            // passengerViewmodel.getRide(),
        builder: (context, passengerViewmodel, __) {
          print('-' * 20);
          
          return Scaffold(
            // body: Center(
            //   child: Text(dependency<CreateRideViewmodel>().createdRide.toString()),
            // ),
            body: PassengerView(ride: passengerViewmodel.createdRide),
          );
        },
      ),
    );
  }
}
