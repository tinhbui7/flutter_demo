import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_state.dart';
import 'package:the_coffee_house/app/styled_widgets/home_slider.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';
import 'package:the_coffee_house/app/styles/styles.dart';
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
      color: theme.splashColor,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          HomeSlider(),
          ...test(),
        ],
      ),
    );
  }

  List<Widget> test() {
    return [
      Text(
        LocaleKeys.title_homeScreen.tr(),
        style: TextStyles.h2,
      ),
      Padding(padding: const EdgeInsets.only(top: 20)),
      Text(
        message ?? '',
        style: TextStyles.h3,
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
            appTheme?.type == ThemeType.Default
                ? ThemeType.Orange_light
                : ThemeType.Default,
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
