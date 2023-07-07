import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/point/point_tab_state.dart';

class PointTabBloc extends BaseBloc<PointTabState> {
  @override
  String get tag => 'PointTabBloc';

  PointTabBloc() : super(PointTabState());
}
