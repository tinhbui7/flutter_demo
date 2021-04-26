import 'package:flutter/material.dart';
import 'package:skycore/screens/base_layout/base_layout_state.dart';
import 'package:skycore/screens/splash/splash_bloc.dart';
import 'package:skycore/screens/splash/splash_state.dart';
import 'package:skycore/routing/app_route.dart';
import 'package:skycore/styles/styles.dart';

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
      child: Text(
        'SPLASH SCREEN',
        style: TextStyles.h2,
      ),
    );
  }
}
