class Ride {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  dynamic _ride;
  dynamic _passenger;
  dynamic _pickup;
  dynamic _destination;
  String _departure;
  String _licenseNumber;

    // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  // ignore: unnecessary_getters_setters
  get ride => _ride;
  // ignore: unnecessary_getters_setters
  set ride(value) => _ride = value;

  // ignore: unnecessary_getters_setters
  get passenger => _passenger;
  // ignore: unnecessary_getters_setters
  set passenger(value) => _passenger = value;

  get pickup => _pickup;
  set pickup(value) => _pickup = value;

  get destination => _destination;
  set destination(value) => _destination = value;

  get departure => _departure;
  set departure(value) => _departure = value;

  get licenseNumber => _licenseNumber;
  set licenseNumber(value) => _licenseNumber = value;

  Ride(
      {dynamic id,
      dynamic ride,
      dynamic passenger,
      dynamic pickup,
      dynamic destination,
      String departure,
      String licenseNumber})
      : _id = id,
        _ride = ride,
        _passenger = passenger,
        _pickup = pickup,
        _destination = destination,
        _departure = departure,
        _licenseNumber = licenseNumber;

  Ride.copy(Ride from)
      : this(
            id: from.id,
            ride: from.ride,
            passenger: from.passenger,
            pickup: from.pickup,
            destination: from.destination,
            departure: from.departure,
            licenseNumber: from.licenseNumber);

  Ride.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          ride: json['ride'],
          passenger: json['passenger'],
          pickup: json['pickup'],
          destination: json['destination'],
          departure: json['departure'],
          licenseNumber: json['licenseNumber']
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ride': ride,
        'passenger': passenger,
        'pickup': pickup,
        'destination': destination,
        'departure': departure,
        'licenseNumber': licenseNumber
      };

}
