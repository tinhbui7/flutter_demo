import 'package:core/constants/global.dart';
import 'package:core/helpers/logger/logger.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:skycore/blocs/app/app_bloc.dart';
import 'package:skycore/blocs/notify/notify_app_bloc.dart';

final getIt = GetIt.instance;

configureDependencies({required Flavor flavor}) async {
  ///register flavor
  getIt.registerSingleton<Flavor>(flavor);

  getIt.registerSingleton<Logger>(Logger());

  ///register repositories
  getIt.registerSingleton<IDemoRepository>(DemoRepository());
  getIt.registerSingleton<ILocalStorageRepository>(LocalStorageRepository());

  ///register services
  getIt.registerFactory<IDemoService>(() => DemoService());
  getIt.registerFactory<ILocalStorageService>(() => LocalStorageService());

  ///register blocs
  getIt.registerSingleton<AppBloc>(AppBloc());
  getIt.registerSingleton<NotifyAppBloc>(NotifyAppBloc());
}
