import '../../app/dependencies.dart';

import '../../services/location/location_service.dart';
import '../../models/location.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class LocationViewmodel extends Viewmodel {
  List<Location> locations;
  User _user;
  Location _location;

  User get user => _user;
  set user(User user) {
    _user = user;
    getList();
  }

  Location get location => 
    (locations != null) && (_location != null) ? _location : null;

  LocationViewmodel();
  LocationService get dataService => dependency();

  Future<void> getList() async {
    if (user == null) return;
    turnBusy();
    locations = await dataService.getLocationList();
    turnIdle();
  }

  Future<void> getLocation(String selectedLoc) async{
    if (user == null) return;
    turnBusy();
    _location = await dataService.getLocation(loc: selectedLoc);
    turnIdle();
  }

  void selectLocation(Location loc) {
    _location = loc;
    turnIdle(); // Only to call to notifyListneres()
  }
}
