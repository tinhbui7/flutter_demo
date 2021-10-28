import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_content/home_base_content_layout.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/other_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/other_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/sub_other_screen/account_section.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/sub_other_screen/support_section.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/sub_other_screen/utilities_section.dart';

class OtherTabScreen extends StatefulWidget {
  const OtherTabScreen({Key? key}) : super(key: key);

  @override
  _OtherTabScreenState createState() => _OtherTabScreenState();
}

class _OtherTabScreenState extends HomeBaseContentLayoutState<OtherTabScreen,
    OtherTabBloc, OtherTabState> {
  @override
  Widget buildContent(BuildContext context) {
    return Container(
      color: theme.splashColor,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowGlow();
          return true;
        },
        child: ListView(
          padding: const EdgeInsets.all(13.0),
          children: [
            UtilitiesSection(),
            SupportSection(),
            AccountSection(),
          ],
        ),
      ),
    );
  }
}
