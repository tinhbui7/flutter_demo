import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/setting/setting_state.dart';

class SettingScreenBloc extends BaseBloc<SettingScreenState> {
  SettingScreenBloc() : super(SettingScreenState(isLoading: false));

  @override
  String get tag => 'SettingScreenBloc';

  @override
  Stream<SettingScreenState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }
}
