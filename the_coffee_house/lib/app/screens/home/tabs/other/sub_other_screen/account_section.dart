import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/app/app_bloc.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/home/home_bloc.dart';
import 'package:the_coffee_house/app/widgets/buttons/tab_other_button.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';


class AccountSection extends StatelessWidget {
  const AccountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 35.0),
          child: Text(
            LocaleKeys.title_account.tr(),
            style: theme.textTheme.subtitle2,
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 10.0)),
        Card(
          elevation: 0.3,
          shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          color: theme.colorScheme.background,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: MediaQuery.of(context).size.height * .26,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabOtherButton(
                  iconButton: Icons.person_outline,
                  contentButton: LocaleKeys.title_personalInformation.tr(),
                ),
                Divider(
                  height: 0,
                  thickness: 1.0,
                  indent: 17.0,
                ),
                TabOtherButton(
                  iconButton: Icons.bookmark_outline,
                  contentButton: LocaleKeys.title_savedAddress.tr(),
                ),
                Divider(
                  height: 0,
                  thickness: 1.0,
                  indent: 17.0,
                ),
                TabOtherButton(
                  iconButton: Icons.settings_outlined,
                  contentButton: LocaleKeys.title_setting.tr(),
                  onPressed: () =>
                      Navigator.pushNamed(context, RouteNames.SETTING),
                ),
                Divider(
                  height: 0,
                  thickness: 1.0,
                  indent: 17.0,
                ),
                TabOtherButton(
                  iconButton: Icons.logout,
                  contentButton: LocaleKeys.title_logOut.tr(),
                  onPressed: () {
                    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
                    HomeScreenBloc homeBloc = BlocProvider.of<HomeScreenBloc>(context);
                    appBloc.changeLoginStatus(false);
                    homeBloc.onItemTab();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
