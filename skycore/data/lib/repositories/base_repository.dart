import 'package:core/constants/global.dart';
import 'package:core/helpers/logger/logger_i.dart';
import 'package:data/repositories/clients/base_client.dart';
import 'package:dio/dio.dart';
import 'package:domain/repositories/base_repository_i.dart';
import 'package:domain/repositories/local_storage_repository_i.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/constants/global.dart';

import '../constants/global.dart';

abstract class BaseRepository<T extends IBaseClient>
    implements IBaseRepository {
  late T client;
  final _tag = 'BaseRepository';

  GetIt get getIt => GetIt.instance;
  ILogger? get _logger => getIt.get<ILogger>();
  Flavor get _flavor => getIt.get<Flavor>();

  ILocalStorageRepository get _localStorage =>
      getIt.get<ILocalStorageRepository>();

  String get subApi;

  String get getAPIUrl => '${getBaseUrl()}/api$subApi';

  String getBaseUrl() {
    switch (_flavor) {
      case Flavor.LOCAL:
        return ApiUrl.LOCAL;
      case Flavor.DEV:
        return ApiUrl.DEV;
      case Flavor.QA:
        return ApiUrl.QA;
      case Flavor.PROD:
        return ApiUrl.PROD;
      case Flavor.MOCK:
        return ApiUrl.MOCK;
    }
  }

  Dio get buildDio {
    final result = Dio();
    result.options.headers = buildHeaders;
    return result;
  }

  Future<String?> getToken() async {
    try {
      return await _localStorage.get(CacheKeys.tokenKey);
    } catch (ex) {
      logError(_tag, 'getToken ${ex.toString()}');
    }
    return null;
  }

  Map<String, String> get buildHeaders => {'Accept': 'application/json'};

  log(String tag, dynamic data) {
    _logger?.log(tag, data);
  }

  logError(String tag, dynamic data) {
    _logger?.logError(tag, data);
  }
}
