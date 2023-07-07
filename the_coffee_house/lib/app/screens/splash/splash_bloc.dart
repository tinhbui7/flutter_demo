import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/splash/splash_state.dart';

class SplashScreenBloc extends BaseBloc<SplashScreenState> {
  @override
  String get tag => 'SplashScreenBloc';

  SplashScreenBloc() : super(SplashScreenState());

  @override
  Stream<SplashScreenState> fetchDataState(
    FetchDataEvent event,
    Emitter<SplashScreenState> emit,
  ) async* {}

  @override
  Stream<SplashScreenState> refreshState(
    RefreshEvent event,
    Emitter<SplashScreenState> emit,
  ) async* {}
}
