import 'package:skycore/base/base_bloc.dart';
import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/screens/splash/splash_state.dart';

class SplashScreenBloc extends BaseBloc<SplashScreenState> {
  @override
  String get tag => 'SplashScreenBloc';

  SplashScreenBloc() : super(SplashScreenState(isLoading: false));

  @override
  Stream<SplashScreenState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }

  @override
  Stream<SplashScreenState> fetchDataState(FetchDataEvent event) async* {}

  @override
  Stream<SplashScreenState> refreshState(RefreshEvent event) async* {}
}
