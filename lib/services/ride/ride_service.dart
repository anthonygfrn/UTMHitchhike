import '../../models/ride.dart';

abstract class RideService {
  Future<List<Ride>> getRideList({int destination});
  Future<Ride> createRide({Ride ride});
  Future<Ride> getRide({int rideId});
  Future<Ride> updatePassenger({int id, int passenger});
}
