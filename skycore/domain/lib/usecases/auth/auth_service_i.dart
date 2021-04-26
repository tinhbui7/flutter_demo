import 'package:domain/entities/auth_entity.dart';

abstract class IAuthService {
  Future<AuthEntity?> login({
    required String userName,
    required String password,
  });
}
