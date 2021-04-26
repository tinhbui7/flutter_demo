import 'package:data/models/auth_model.dart';
import 'package:domain/repositories/base_repository_i.dart';

abstract class IUserRepository extends IBaseRepository {
  Future<AuthModel?> login({
    required String userName,
    required String password,
  });
}
