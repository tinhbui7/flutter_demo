import 'package:data/models/auth_model.dart';
import 'package:data/repositories/clients/base_client.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient implements IBaseClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @POST('/login')
  @FormUrlEncoded()
  Future<AuthModel?> login({
    // @Header('Authorization') String? token,
    @Field() required String userName,
    @Field() required String password,
  });
}
