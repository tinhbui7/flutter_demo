import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:the_coffee_house/core/constants/global.dart';
import 'package:the_coffee_house/core/helpers/logger/logger_i.dart';
import 'package:the_coffee_house/domain/repositories/local_storage_repository_i.dart';

class LocalStorageRepository extends ILocalStorageRepository {
  final _tag = 'LocalStorageRepository';
  late Box _box;
  GetIt get getIt => GetIt.instance;
  ILogger? get _logger => getIt.get<ILogger>();

  LocalStorageRepository() {
    _init();
  }

  _init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive..init(directory.path);
    _box = await Hive.openBox(LocalDBName.mainCache);
  }

  log(String tag, dynamic data) {
    _logger?.log(tag, data);
  }

  logError(String tag, dynamic data) {
    _logger?.logError(tag, data);
  }

  @override
  Future clean() async {
    try {
      return await _box.clear();
    } catch (ex) {
      logError(_tag, 'clean ${ex.toString()}');
    }
  }

  @override
  Future delete(String key) async {
    try {
      return await _box.delete(key);
    } catch (ex) {
      logError(_tag, 'delete ${ex.toString()}');
    }
  }

  @override
  Future get(String key) async {
    try {
      return await _box.get(key);
    } catch (ex) {
      logError(_tag, 'get ${ex.toString()}');
    }
  }

  @override
  Future set(String key, value) async {
    try {
      return await _box.put(key, value);
    } catch (ex) {
      logError(_tag, 'set ${ex.toString()}');
    }
  }
}
