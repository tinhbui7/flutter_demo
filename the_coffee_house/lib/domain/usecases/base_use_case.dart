import 'package:the_coffee_house/core/helpers/logger/logger_i.dart';
import 'package:the_coffee_house/domain/repositories/base_repository_i.dart';
import 'package:get_it/get_it.dart';
import 'package:the_coffee_house/domain/repositories/repositories.dart';

abstract class BaseUseCase<T extends IBaseRepository> {
  String get tag;

  GetIt get getIt => GetIt.instance;

  ILogger? get logger => getIt.get<ILogger>();
  T? get repository => getIt.get<T>();

  ISectionRepository? get sectionUseCase => getIt.get<ISectionRepository>();

  log(String tag, dynamic data) {
    logger?.log(tag, data);
  }

  logError(String tag, dynamic data) {
    logger?.logError(tag, data);
  }
}
