import '../../models/user.dart';

abstract class UserService {
  Future<List<User>> getUserList();
  Future<User> getUser({int userId});
}
