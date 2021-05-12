import 'package:the_coffee_house/domain/repositories/base_repository_i.dart';
import 'package:dio/dio.dart';

import 'clients/base_client.dart';

abstract class BaseRepository<T extends IBaseClient>
    implements IBaseRepository {
  late T client;

  Dio get buildDio {
    final result = Dio();
    result.options.headers = buildHeaders;
    return result;
  }

  String get subApi;

  Map<String, String> get buildHeaders => {'Accept': 'application/json'};
}
