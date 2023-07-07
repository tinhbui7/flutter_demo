import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/setting/setting_state.dart';

class SettingScreenBloc extends BaseBloc<SettingScreenState> {
  @override
  String get tag => 'SettingScreenBloc';

  SettingScreenBloc() : super(SettingScreenState());
}
