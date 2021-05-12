import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/splash/splash_bloc.dart';
import 'package:the_coffee_house/app/screens/splash/splash_state.dart';
import 'package:the_coffee_house/app/styles/styles.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState
    extends BaseLayoutState<SplashScreen, SplashScreenBloc, SplashScreenState> {
  _SplashScreenState() {
    bloc = SplashScreenBloc();
    bloc?.fetchData();
  }

  @override
  AppBar? buildAppBar(BuildContext context) => null;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      Navigator.of(context).pushReplacementNamed(RouteNames.HOME);
    });
  }

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Image(
        image: AssetImage(
            'assets/images/init_image/1024px-The_Coffee_House_logo.png'),
      ),
    );
  }
}
