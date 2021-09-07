import 'package:architecture_provider/models/user.dart';
import 'package:architecture_provider/models/location.dart';
import 'package:architecture_provider/screens/login/login_viewmodel.dart';
import 'package:architecture_provider/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../createride_viewmodel.dart';
import '../../../app/dependencies.dart';

class RideView extends StatelessWidget {
  RideView();

  @override
  Widget build(BuildContext context) {
    return View<LoginViewmodel>(
      builder: (_, viewmodel, ___) {
        final createRideViewmodel = dependency<CreateRideViewmodel>();
        List<Location> locations = createRideViewmodel.locations;
        List<String> locationNames = [];
        for (var i = 0; i < locations.length; i++){
          locationNames.add(locations[i].name);
        }
        String destinationChoose = createRideViewmodel.destination;
        String pickupChoose = createRideViewmodel.pickup;

        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: Text("Destination", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: DropdownButton(
                      hint: Text("Enter destination"),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: destinationChoose,
                      onChanged: (newValue) {
                        destinationChoose = newValue;
                        createRideViewmodel.selectDestination(newValue);
                      },
                      items: locationNames.map((loc){
                        return DropdownMenuItem(
                          value: loc,
                          child: Text(loc),
                          );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    child: Text("Origin", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),),
                    alignment: Alignment.centerLeft,
                  ),
                  Container(
                    child: DropdownButton(
                      hint: Text("Enter current location"),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      value: pickupChoose,
                      onChanged: (newValue) {
                        pickupChoose = newValue;
                        createRideViewmodel.selectPickup(newValue);
                      },
                      items: locationNames.map((loc){
                        return DropdownMenuItem(
                          value: loc,
                          child: Text(loc),
                          );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            _buildTextLisTile(
              label: 'Departure Time (24 hr format, e.g. 18:40)',
              value: '',
              onChanged: (value) {
                createRideViewmodel.dep = value;
              },
            ),
            _buildTextLisTile(
              label: 'Your vehicle license number',
              value: '',
              onChanged: (value) {
                createRideViewmodel.lic = value;
              },
            )
          ],
        );
      }
      );
    }
  }

  ListTile _buildTextLisTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label, labelStyle: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)
        ),
        onChanged: onChanged,
      ),
    );
  }
