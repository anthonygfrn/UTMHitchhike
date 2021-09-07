import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../rest_service.dart';
import 'user_service.dart';

class UserServiceRest implements UserService {
  final rest = dependency<RestService>();

  Future<List<User>> getUserList() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  @override
  Future<User> getUser({int userId}) async {
    final listJson = await rest.get('users?id=$userId');
    if (listJson.length != 0) {
      return User.fromJson(listJson[0]);
    } else {
      return null;
    }
  }
}
