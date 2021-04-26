import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:skycore/app_initializer.dart';
import 'package:skycore/blocs/app/app_bloc.dart';
import 'package:skycore/blocs/notify/notify_app_bloc.dart';
import 'package:skycore/routing/app_route.dart';
import 'package:skycore/screens/splash/splash_screen.dart';

import 'blocs/app/app_state.dart';
import 'screens/base_layout/base_state.dart';

class SkyApp extends StatefulWidget {
  @override
  _SkyAppState createState() => _SkyAppState();
}

class _SkyAppState extends BaseState<SkyApp> {
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
            title: 'Sky Core Flutter',
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
