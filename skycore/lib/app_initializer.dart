import 'dart:async';

import 'package:core/constants/global.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';
import 'app_observer.dart';
import 'constants/global.dart';
import 'injections/injections.dart';

class Initializer {
  // final _tag = 'Initializer';
  static late Initializer _instance;
  static Initializer get self => _instance;
  Flavor? _flavor;
  late AppObserver _observer;
  AppObserver get observer => _observer;
  bool? _isInitialized;

  Initializer(Flavor flavor) {
    if (_isInitialized != true) {
      _flavor = flavor;
      _init();
    }
    _isInitialized = true;
    _instance = this;
  }

  Future _init() async {
    if (_flavor == null) {
      throw ArgumentError.value(_flavor, 'flavor', 'must be NOT NULL');
    }
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    _observer = AppObserver();

    await configureDependencies(flavor: _flavor ?? Flavor.DEV);
    runZonedGuarded(
      () {
        runApp(
          EasyLocalization(
            supportedLocales: [
              Locale(LanguageCode.en),
              Locale(LanguageCode.vi),
            ],
            path: 'assets/translations',
            fallbackLocale: Locale(LanguageCode.en),
            useOnlyLangCode: true,
            child: SkyApp(),
          ),
        );
      },
      (error, stackTrace) {},
    );
  }
}
