import 'package:domain/entities/auth_entity.dart';
import 'package:domain/repositories/repositories.dart';
import 'package:domain/usecases/base_service.dart';

import 'auth_service_i.dart';

class AuthService extends BaseService<IUserRepository> implements IAuthService {
  String get tag => 'AuthService';

  @override
  Future<AuthEntity?> login({
    required String userName,
    required String password,
  }) async {
    try {
      final model = await repository?.login(
        userName: userName,
        password: password,
      );
      return model != null ? AuthEntity.fromModel(model) : null;
    } catch (ex) {
      logError(tag, 'login ${ex.toString()}');
      throw ex;
    }
  }
}
