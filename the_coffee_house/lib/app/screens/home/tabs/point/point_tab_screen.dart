import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_content/home_base_content_layout.dart';
import 'package:the_coffee_house/app/screens/home/tabs/point/point_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/point/point_tab_state.dart';

class PointTabScreen extends StatefulWidget {
  const PointTabScreen({Key? key}) : super(key: key);

  @override
  _PointTabScreenState createState() => _PointTabScreenState();
}

class _PointTabScreenState extends HomeBaseContentLayoutState<PointTabScreen,
    PointTabBloc, PointTabState> {
  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Text(
        'POINT TAB',
        style: theme.textTheme.headline2,
      ),
    );
  }
}
