import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:the_coffee_house/app/app_initializer.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_bloc.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:the_coffee_house/app/screens/home/home_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/splash/splash_screen.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';

import 'blocs/app/app_bloc.dart';
import 'blocs/app/app_state.dart';

class TchApp extends StatefulWidget {
  @override
  _TchAppState createState() => _TchAppState();
}

class _TchAppState extends BaseState<TchApp> {
  GetIt get getIt => GetIt.instance;
  AppBloc get _appBloc => getIt.get<AppBloc>();
  NotifyAppBloc get _notifyAppBloc => getIt.get<NotifyAppBloc>();
  HomeScreenBloc get _homeBloc => getIt.get<HomeScreenBloc>();
  CartBloc get _cartBloc => getIt.get<CartBloc>();
  OrderTabBloc get _orderTabBloc => getIt.get<OrderTabBloc>();
  StoreTabBloc get _storeTabBloc => getIt.get<StoreTabBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _appBloc,
      builder: (context, AppState _state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppBloc>.value(value: _appBloc),
            BlocProvider<NotifyAppBloc>.value(value: _notifyAppBloc),
            BlocProvider<HomeScreenBloc>.value(value: _homeBloc),
            BlocProvider<CartBloc>.value(value: _cartBloc),
            BlocProvider<OrderTabBloc>.value(value: _orderTabBloc),
            BlocProvider<StoreTabBloc>.value(value: _storeTabBloc),
          ],
          child: MaterialApp(
            title: 'The Coffee House',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateRoute: onAppGenerateRoute,
            navigatorObservers: [
              Initializer.self.observer,
            ],
            theme: AppTheme.build(context, theme: _state.appTheme),
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
