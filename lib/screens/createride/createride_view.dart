import 'package:architecture_provider/screens/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view.dart';
import 'createride_viewmodel.dart';
import '../location/location_viewmodel.dart';
import '../../app/dependencies.dart';
import 'widgets/appbar_view.dart';
import 'widgets/ride_view.dart';

class CreateRideScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => CreateRideScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(),
      body: View<CreateRideViewmodel>(
        initViewmodel: (createRideViewmodel) =>
            createRideViewmodel.user = dependency<LoginViewmodel>().user,
        builder: (context, rideViewmodel, __) {
          print('-' * 20);

          final locations = rideViewmodel.locations;

          return Scaffold(
            body: RideView(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          dependency<CreateRideViewmodel>().addNewRide();
          showDialog(
            context: context, 
            builder: (BuildContext context){
              return AlertDialog(
                title: new Text("Create Ride"),
                content: new Text("Are you sure you want to create this ride?"),
                actions: <Widget>[
                  new TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/passenger'), 
                    child: Text("Yes"))
                ],
              );
            });
          
        },
        icon: Icon(Icons.arrow_forward),
        label: Text("Give a ride"),
      ),
    );
  }
}

