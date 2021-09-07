import 'package:architecture_provider/models/ride.dart';
import 'package:architecture_provider/models/user.dart';
import 'package:architecture_provider/models/location.dart';
import 'package:architecture_provider/screens/login/login_viewmodel.dart';
import 'package:architecture_provider/screens/ridelist/widgets/ride_view.dart';
import 'package:architecture_provider/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../passengerScreen_viewmodel.dart';
import '../../../app/dependencies.dart';

class PassengerView extends StatelessWidget {
  final Ride ride;
  PassengerView({this.ride});

  @override
  Widget build(BuildContext context) {
    
    return View<LoginViewmodel>(
      builder: (_, viewmodel, ___) {
        final passengerViewmodel = dependency<PassengerViewmodel>();
        final ridePassenger = passengerViewmodel.passenger;
        final passengerName = passengerViewmodel.passengerName;
        final passengerAvatar = passengerViewmodel.passengerAvatar;
        final pickup = passengerViewmodel.pickupLocation;
        final destination = passengerViewmodel.destinationLocation;
        // if(ridePassenger.id != 0){
        //   final user = passengerViewmodel.users.firstWhere((element) => element.id == ride.passenger);
        // }
        // if(ridePassenger == null){
        //   passengerViewmodel.checkPassenger();
        // }

        
        // return Scaffold(
        //   body: Center(
        //     child: Text(passenger.toString()),
        //   ),
        // );
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  // Center(
                  //   child: Text(ride.toString()),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ride.passenger == 0  ? Icon(Icons.account_circle_rounded, size: 50,) : CircleAvatar(
                      radius: 80.0,
                      backgroundImage: NetworkImage(passengerAvatar),
                      backgroundColor: Colors.transparent,)),
                  SizedBox(
                    child: Container(
                      child: ride.passenger == 0 ? Text("No passenger yet",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                      )) : Text('$passengerName',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),),
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
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          passengerViewmodel.checkPassenger();
                        }, 
                        icon: Icon(Icons.refresh), 
                        label: Text('Check for Passenger'),
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
