import '../../models/location.dart';

abstract class LocationService {
  Future<List<Location>> getLocationList();
  Future<Location> getLocation({String loc});
  Future<Location> getLocationbyId({int locationId});
  Future<Location> getLocationbyName({String locationName});
}
