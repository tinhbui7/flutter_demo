import 'package:domain/entities/base_entity.dart';
import 'package:data/models/auth_model.dart';

class AuthEntity extends BaseEntity {
  String? token;
  AuthEntity({this.token});

  factory AuthEntity.fromModel(AuthModel? model) {
    return AuthEntity(
      token: model?.token,
    );
  }
}
