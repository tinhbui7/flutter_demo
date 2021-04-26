import 'package:core/helpers/logger/logger_i.dart';
import 'package:domain/repositories/base_repository_i.dart';
import 'package:get_it/get_it.dart';

abstract class BaseService<T extends IBaseRepository> {
  String get tag;

  GetIt get getIt => GetIt.instance;

  ILogger? get logger => getIt.get<ILogger>();
  T? get repository => getIt.get<T>();

  BaseService();

  log(String tag, dynamic data) {
    logger?.log(tag, data);
  }

  logError(String tag, dynamic data) {
    logger?.logError(tag, data);
  }
}
