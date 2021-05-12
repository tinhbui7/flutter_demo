import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:the_coffee_house/app/app_initializer.dart';
import 'package:the_coffee_house/app/blocs/notify/notify_app_bloc.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:the_coffee_house/app/screens/splash/splash_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _appBloc,
      builder: (context, AppState _state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppBloc>.value(value: _appBloc),
            BlocProvider<NotifyAppBloc>.value(value: _notifyAppBloc),
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
            theme: _state.appTheme?.themeData,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
