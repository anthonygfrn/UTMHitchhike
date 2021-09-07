import '../../app/dependencies.dart';
import '../../models/location.dart';
import '../rest_service.dart';
import 'location_service.dart';

class LocationServiceRest implements LocationService {
  final rest = dependency<RestService>();

  Future<List<Location>> getLocationList() async {
    final listJson = await rest.get('locations');

    return (listJson as List)
        .map((itemJson) => Location.fromJson(itemJson))
        .toList();
  }

  @override
  Future<Location> getLocation({String loc}) async {
    final listJson = await rest.get('locations?name=$loc');

    if (listJson.length != 0) {
      return Location.fromJson(listJson[0]);
    } else {
      return null;
    }
  }

  @override
  Future<Location> getLocationbyId({int locationId}) async {
    final listJson = await rest.get('locations?id=$locationId');
    if (listJson.length != 0) {
      return Location.fromJson(listJson[0]);
    } else {
      return null;
    }
  }

  @override
  Future<Location> getLocationbyName({String locationName}) async {
    final listJson = await rest.get('locations?name=$locationName');
    if (listJson.length != 0) {
      return Location.fromJson(listJson[0]);
    } else {
      return null;
    }
  }
}
