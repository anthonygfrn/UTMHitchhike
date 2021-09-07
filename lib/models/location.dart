// import 'dart:html';

class Location {
  dynamic _id; // Use dynamic type because json-server id is int and firestore id is string
  String _name;
  String _type;

    // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  // ignore: unnecessary_getters_setters
  get name => _name;
  // ignore: unnecessary_getters_setters
  set name(value) => _name = value;

  // ignore: unnecessary_getters_setters
  get type => _type;
  // ignore: unnecessary_getters_setters
  set type(value) => _type = value;


  Location(
      {dynamic id,
      String name,
      String type,})
      : _id = id,
        _name = name,
        _type = type;

  Location.copy(Location from)
      : this(
            id: from.id,
            name: from.name,
            type: from.type,);

  Location.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          type: json['type'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
  };
}
