import 'package:bloc_5/models/user.dart';
import 'package:bloc_5/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers() => _userProvider.getUser();
}
