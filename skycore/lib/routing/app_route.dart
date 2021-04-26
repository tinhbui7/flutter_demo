import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skycore/screens/home/home_screen.dart';

class RouteNames {
  static const SPLASH = '/Splash';
  static const HOME = '/Home';
}

Route onAppGenerateRoute(RouteSettings routeSettings) {
  WidgetBuilder builder;

  ///find route name
  var _routeName = routeSettings.name;
  var splits = _routeName?.split("?params=");
  if (splits?.isNotEmpty == true) {
    _routeName = splits?.first;
  }
  switch (_routeName) {
    case RouteNames.SPLASH:
      builder = (BuildContext context) => HomeScreen();
      break;
    default:
      builder = (BuildContext context) => HomeScreen();
      break;
  }
  return MaterialPageRoute(
    builder: builder,
    settings: routeSettings,
  );
}
