import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/home/home_bloc.dart';
import 'package:the_coffee_house/app/screens/home/home_state.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';
import 'package:the_coffee_house/app/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseLayoutState<HomeScreen, HomeScreenBloc, HomeScreenState> {
  _HomeScreenState() {
    bloc = HomeScreenBloc();
    bloc?.fetchData();
  }

  String? get message => state?.message;

  late String nowMessage;

  @override
  String get title => 'Home App';

  @override
  Widget? buildLeadingWidget(BuildContext context) => null;

  @override
  Widget buildContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.title_homeScreen.tr(),
            style: TextStyles.h2,
          ),
          Padding(padding: const EdgeInsets.only(top: 20)),
          Text(
            message ?? 'Welcome to Flutter',
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
        ],
      ),
    );
  }
}
