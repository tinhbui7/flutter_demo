import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/home_banner.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/home_slider.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/list_notifications.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/option_order_button.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

import '../home_base_content_layout.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends HomeBaseContentLayoutState<HomeTabScreen,
    HomeTabBloc, HomeTabState> {
  _HomeTabScreenState() {
    bloc = HomeTabBloc();
    bloc?.fetchData();
  }

  String? get message => state?.message;

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          stops: [0.1, 0.8, 1],
          colors: [
            Colors.black,
            Colors.orange,
            theme.splashColor,
          ],
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          HomeSlider(),
          Padding(padding: const EdgeInsets.only(top: 15)),
          OptionOrderButton(),
          Padding(padding: const EdgeInsets.only(top: 15)),
          HomeBanner(),
          Padding(padding: const EdgeInsets.only(top: 15)),
          ListNotifications(),
          Padding(padding: const EdgeInsets.only(top: 15)),
          ...test(),
        ],
      ),
    );
  }

  List<Widget> test() {
    return [
      Text(
        LocaleKeys.title_homeScreen.tr(),
        style: theme.textTheme.headline2,
      ),
      Padding(padding: const EdgeInsets.only(top: 20)),
      Text(
        message ?? '',
        style: theme.textTheme.headline3,
      ),
      Padding(padding: const EdgeInsets.only(top: 20)),
      OutlinedButton(
        child: Text('Product'),
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.PRODUCT);
        },
      ),
      Padding(padding: const EdgeInsets.only(top: 20)),
      OutlinedButton(
        child: Text('Change Theme'),
        onPressed: () {
          appBloc?.changeAppTheme(
            appTheme == ThemeType.Dark ? ThemeType.Light : ThemeType.Dark,
          );
        },
      ),
      Padding(padding: const EdgeInsets.only(top: 20)),
      OutlinedButton(
        child: Text('Language'),
        onPressed: () {
          context.setLocale(context.locale.languageCode == 'en'
              ? Locale('vi')
              : Locale('en'));
        },
      ),
      Padding(padding: const EdgeInsets.only(top: 20)),
      OutlinedButton(
        child: Text('Save Message'),
        onPressed: () {
          bloc?.saveMessage(message == 'Welcome to Flutter'
              ? 'Hello Flutter'
              : 'Welcome to Flutter');
        },
      ),
    ];
  }
}
