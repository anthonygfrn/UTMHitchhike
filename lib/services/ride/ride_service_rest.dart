import 'package:architecture_provider/models/user.dart';

import '../../app/dependencies.dart';
import '../../models/ride.dart';
import '../rest_service.dart';
import 'ride_service.dart';

class RideServiceRest implements RideService {
  final rest = dependency<RestService>();

  Future<List<Ride>> getRideList({int destination}) async {
    final listJson = await rest.get('rides?destination=$destination');

    return (listJson as List)
        .map((itemJson) => Ride.fromJson(itemJson))
        .toList();
  }


  Future<Ride> createRide({Ride ride}) async {
    final json = await rest.post('rides', data: ride);
    return Ride.fromJson(json);
  }

  Future<Ride> getRide({int rideId}) async {
    final listJson = await rest.get('rides?id=$rideId');
    if (listJson.length != 0) {
      return Ride.fromJson(listJson[0]);
    } else {
      return null;
    }
  }

  Future<Ride> updatePassenger({int id, int passenger}) async {
    final json = await rest.patch('rides/$id', data: {'passenger': passenger});
    return Ride.fromJson(json);
  }
}
