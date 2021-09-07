import 'package:architecture_provider/app/dependencies.dart';
import 'package:architecture_provider/screens/location/location_viewmodel.dart';
import 'package:architecture_provider/screens/view.dart';
import 'package:architecture_provider/screens/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:architecture_provider/models/location.dart';
import 'package:flutter/cupertino.dart';

class LocationSearch extends SearchDelegate<String>{
  List<Location> locations;
  List<String> locationList = [];

  LocationSearch(this.locations){
    for (var i = 0; i < locations.length; i++){
      locationList.add(locations[i].name);
    }

  }


  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
      icon: Icon(Icons.clear), 
      onPressed: () {
        query = '';
      }
    )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,
      ), 
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = locationList.where((loc) {
      return loc.toLowerCase().contains(query.toLowerCase());
    });

    return View<LocationViewmodel>(
      initViewmodel: (viewmodel) => viewmodel.getList(),
      builder: (_, viewmodel, ___) {
        final locationViewmodel = dependency<LocationViewmodel>();
        

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: () {
              viewmodel.selectLocation(locationViewmodel.locations[index]);
              Navigator.pushReplacementNamed(context, '/rideList');
            },
            leading: Icon(Icons.location_on_rounded),
            title: Text(suggestions.elementAt(index),),
          );
        });
      });
  }

}
