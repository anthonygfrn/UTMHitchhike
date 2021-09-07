import 'package:architecture_provider/app/dependencies.dart';
import 'package:architecture_provider/screens/location/widgets/location_search.dart';
import 'package:architecture_provider/screens/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import 'location_viewmodel.dart';
import 'widgets/appbar_view.dart';
import '../../app/router.dart' as router;

class LocationScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => LocationScreen());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(),
      body: View<LocationViewmodel>(
        initViewmodel: (locationViewmodel) =>
            locationViewmodel.user = dependency<LoginViewmodel>().user,
        builder: (context, locationViewmodel, __) {
          print('-' * 20);

          return Center(
            child: Column(
              children: <Widget>[
                Container(height: 50,),
                Center(child: Text('Hello ${locationViewmodel.user.name}, where would you like to go to today?'),),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton.icon(
                    onPressed: () {
                      showSearch(context: context, delegate: LocationSearch(locationViewmodel.locations));
                    }, 
                    icon: Icon(Icons.location_on_rounded, color: Colors.grey[400],), 
                    label: Text('Where to...', style: TextStyle(color: Colors.grey[400]),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[50],
                      side: BorderSide(width: 2.0, color: Colors.grey[400]),
                    )
                  ),
                  ),
                )
              ],
            )
            
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/createride');
        },
        icon: Icon(Icons.directions_car_rounded),
        label: Text("Give a ride instead"),
      ),
    );
  }
}
