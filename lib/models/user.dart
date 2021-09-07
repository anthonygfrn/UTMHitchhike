class User {
  int _id;
  String _name;
  String _avatar;

  get id => _id;
  set id(value) => _id = value;
  get name => _name;
  set name(value) => _name = value;
  get avatar => _avatar;
  set avatar(value) => _avatar = value;

  User({int id, String name, String avatar}) : 
    _id = id, 
    _name = name, 
    _avatar = avatar;

  // User.fromJson(Map<String, dynamic> json)
  //     : this(id: json['id'], name: json['name'], avatar: json['avatar']);

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          avatar: json['avatar'],
        );
}
