import 'package:get_it/get_it.dart';
import 'package:the_coffee_house/app/blocs/app/app_bloc.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_bloc.dart';
import 'package:the_coffee_house/core/constants/global.dart';
import 'package:the_coffee_house/core/helpers/logger/logger.dart';
import 'package:the_coffee_house/data/repositories/local_storage_repository.dart';
import 'package:the_coffee_house/data/repositories/product_repository.dart';
import 'package:the_coffee_house/domain/repositories/local_storage_repository_i.dart';
import 'package:the_coffee_house/domain/repositories/product_repository_i.dart';
import 'package:the_coffee_house/domain/usecases/local_storage/local_storage_service.dart';
import 'package:the_coffee_house/domain/usecases/local_storage/local_storage_service_i.dart';
import 'package:the_coffee_house/domain/usecases/product/product_use_case.dart';
import 'package:the_coffee_house/domain/usecases/product/product_use_case_i.dart';

final getIt = GetIt.instance;

configureDependencies({required Flavor flavor}) async {
  getIt.registerSingleton<Flavor>(flavor);

  getIt.registerSingleton<Logger>(Logger());

  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<ILocalStorageRepository>(LocalStorageRepository());

  getIt.registerFactory<IProductUseCase>(() => ProductUseCase());
  getIt.registerFactory<ILocalStorageService>(() => LocalStorageService());

  getIt.registerSingleton<AppBloc>(AppBloc());
  getIt.registerSingleton<NotifyAppBloc>(NotifyAppBloc());
}
