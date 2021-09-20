import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/delivery_address/delivery_address_screen.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_screen.dart';
import 'package:the_coffee_house/app/screens/home/home_screen.dart';
import 'package:the_coffee_house/app/screens/product/product_sceen.dart';

class RouteNames {
  static const SPLASH = '/Splash';
  static const HOME = '/Home';
  static const PRODUCT = '/Product';
  static const DELIVERY = '/Delivery';
  static const MAP = '/MapDelivery';
}

Route onAppGenerateRoute(RouteSettings routeSettings) {
  WidgetBuilder builder;

  var _routerName = routeSettings.name;
  var splits = _routerName?.split("?params=");
  if (splits?.isNotEmpty == true) {
    _routerName = splits?.first;
  }
  switch (_routerName) {
    case RouteNames.SPLASH:
      builder = (BuildContext context) => HomeScreen();
      break;
    case RouteNames.PRODUCT:
      builder = (BuildContext context) => ProductScreen();
      break;
    case RouteNames.DELIVERY:
      builder = (BuildContext context) => DeliveryAddressScreen();
      break;
    case RouteNames.MAP:
      builder = (BuildContext context) => SelectMapScreen();
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
