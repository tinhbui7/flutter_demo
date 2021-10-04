import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home_base_content_layout.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_state.dart';

class StoreTabScreen extends StatefulWidget {
  const StoreTabScreen({Key? key}) : super(key: key);

  @override
  _StoreTabScreenState createState() => _StoreTabScreenState();
}

class _StoreTabScreenState extends HomeBaseContentLayoutState<StoreTabScreen,
    StoreTabBloc, StoreTabState> {
  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Text(
        'STORE TAB',
        style: theme.textTheme.headline2,
      ),
    );
  }
}
