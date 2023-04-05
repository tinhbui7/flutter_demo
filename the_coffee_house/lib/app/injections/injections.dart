import 'package:get_it/get_it.dart';
import 'package:the_coffee_house/app/blocs/app/app_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_bloc.dart';
import 'package:the_coffee_house/app/screens/home/home_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_bloc.dart';
import 'package:the_coffee_house/core/constants/global.dart';
import 'package:the_coffee_house/core/helpers/logger/logger.dart';
import 'package:the_coffee_house/data/repositories/repositories.dart';
import 'package:the_coffee_house/domain/domain.dart';

final getIt = GetIt.instance;

configureDependencies({required Flavor flavor}) async {
  getIt.registerSingleton<Flavor>(flavor);

  getIt.registerSingleton<Logger>(Logger());

  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<ILocalStorageRepository>(LocalStorageRepository());
  getIt.registerSingleton<ISectionRepository>(SectionRepository());
  getIt.registerSingleton<IStoreRepository>(StoreRepository());

  getIt.registerFactory<IProductUseCase>(() => ProductUseCase());
  getIt.registerFactory<ILocalStorageService>(() => LocalStorageService());
  getIt.registerFactory<ISectionUseCase>(() => SectionUseCase());
  getIt.registerFactory<IStoreUseCase>(() => StoreUseCase());

  getIt.registerSingleton<AppBloc>(AppBloc());
  getIt.registerSingleton<NotifyAppBloc>(NotifyAppBloc());
  getIt.registerSingleton<HomeScreenBloc>(HomeScreenBloc());
  getIt.registerSingleton<CartBloc>(CartBloc());
  getIt.registerSingleton<OrderTabBloc>(OrderTabBloc());
  getIt.registerSingleton<StoreTabBloc>(StoreTabBloc());
}
