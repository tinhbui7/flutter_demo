import 'package:data/models/auth_model.dart';
import 'package:data/repositories/base_repository.dart';
import 'package:data/repositories/clients/user_client.dart';
import 'package:domain/repositories/user_repository_i.dart';

class UserRepository extends BaseRepository<UserClient>
    implements IUserRepository {
  UserRepository() {
    client = UserClient(buildDio, baseUrl: getAPIUrl);
  }

  @override
  String get subApi => '/users/';

  @override
  Future<AuthModel?> login({
    required String userName,
    required String password,
  }) async {
    return await client.login(userName: userName, password: password);
  }
}
