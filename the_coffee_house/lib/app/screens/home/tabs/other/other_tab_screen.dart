import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home_base_content_layout.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/other_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/other_tab_state.dart';

class OtherTabScreen extends StatefulWidget {
  const OtherTabScreen({Key? key}) : super(key: key);

  @override
  _OtherTabScreenState createState() => _OtherTabScreenState();
}

class _OtherTabScreenState extends HomeBaseContentLayoutState<OtherTabScreen,
    OtherTabBloc, OtherTabState> {
  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Text(
        'OTHER TAB',
        style: theme.textTheme.headline2,
      ),
    );
  }
}
