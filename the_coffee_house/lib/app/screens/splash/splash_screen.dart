import 'package:flutter/material.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_events.dart';
import 'package:the_coffee_house/app/screens/splash/splash_bloc.dart';
import 'package:the_coffee_house/app/screens/splash/splash_state.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BaseLayoutState<SplashScreen, SplashScreenBloc, SplashScreenState> {
  _SplashScreenState() {
    bloc = SplashScreenBloc();
  }

  @override
  AppBar? buildAppBar(BuildContext context) => null;

  @override
  void initState() {
    super.initState();
    orderBloc?.add(LoadProductsDataEvent());
    storeBloc?.add(LoadStoresDataEvent());
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      Navigator.of(context).pushReplacementNamed(RouteNames.HOME);
    });
  }

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Image(
        width: 200,
        height: 125,
        fit: BoxFit.contain,
        color: theme.colorScheme.onBackground,
        image: AssetImage(Assets.logoSplash),
      ),
    );
  }
}
