import 'package:architecture_provider/models/ride.dart';
import 'package:architecture_provider/models/user.dart';
import 'package:architecture_provider/models/location.dart';
import 'package:architecture_provider/screens/login/login_viewmodel.dart';
import 'package:architecture_provider/screens/ridelist/widgets/ride_view.dart';
import 'package:architecture_provider/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../rideScreen_viewmodel.dart';
import '../../../app/dependencies.dart';

class RideView extends StatelessWidget {
  final Ride ride;
  RideView({this.ride});

  @override
  Widget build(BuildContext context) {
    
    return View<LoginViewmodel>(
      builder: (_, viewmodel, ___) {
        final rideViewmodel = dependency<RideViewmodel>();
        final ride = rideViewmodel.selectedRide;
        final user = rideViewmodel.rideUser;
        final pickup = rideViewmodel.pickupLocation;
        final destination = rideViewmodel.destinationLocation;
        final passenger = rideViewmodel.passenger;

        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage: NetworkImage(user.avatar),
                      backgroundColor: Colors.transparent,)),
                  SizedBox(
                    child: Column(
                      children: [
                        Text('${user.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                            ),),
                        Text('${ride.licenseNumber}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey[800]
                          ),
                        ),
                      ],
                    )),
                  Container(
                    height: 120,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0,10.0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text('Origin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('${pickup.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey[600],
                            size: 36.0,
                            ),
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10.0,
                                  offset: Offset(0.0,10.0)
                                )
                              ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text('Destination',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('${destination.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                          offset: Offset(0.0,10.0)
                        )
                      ]
                    ),
                    child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text('Departure',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text('${ride.departure}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 80,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            offset: Offset(0.0,10.0)
                          )
                        ]
                      ),
                      child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: CircleAvatar(
                                        child: ride.passenger == 0 ? Icon(Icons.account_circle_rounded, size: 50,) : CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(passenger.avatar),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 270,
                                    alignment: Alignment.centerLeft,
                                    child: ride.passenger == 0 ? Text("No Passenger") : Text("${passenger.name}"),
                                  )
                                ],
                              ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          rideViewmodel.joinRide(viewmodel.user.id);
                        }, 
                        icon: Icon(Icons.directions_car_rounded), 
                        label: Text('Join This Ride'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                    )
                  ),
                  ))
                ],),
            ),
          )
        );
      },
    );
  }
}
