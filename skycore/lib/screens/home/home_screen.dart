import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skycore/blocs/notify/notify_app_state.dart';
import 'package:skycore/generated/locale_keys.g.dart';
import 'package:skycore/screens/base_layout/base_layout_state.dart';
import 'package:skycore/styles/app_theme.dart';
import 'package:skycore/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skycore/utils/snack_bar_utils.dart';

import 'home_bloc.dart';
import 'home_state.dart';

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

  @override
  String get title => 'Home App';

  @override
  Widget? buildLeadingWidget(BuildContext context) => null;

  @override
  Widget buildBaseContent(BuildContext context) {
    return BlocListener(
      bloc: notifyAppBloc,
      listener: (context, NotifyAppState _state) {
        if (_state.message?.isNotEmpty == true) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBarUtils.buildSnackBarWithRightButton(
              context,
              _state.message ?? '',
              'OK',
              () {},
            ),
          );
        }
      },
      child: super.buildBaseContent(context),
    );
  }

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
            message ?? 'Empty',
            style: TextStyles.h3,
          ),
          Padding(padding: const EdgeInsets.only(top: 20)),
          OutlinedButton(
            child: Text('Toggle Theme'),
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
            child: Text('Toggle Locale'),
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
              bloc?.saveMessage('Hello motor =))');
            },
          ),
        ],
      ),
    );
  }
}
