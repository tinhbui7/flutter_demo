import 'package:flutter/material.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/app/app_events.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/setting/setting_bloc.dart';
import 'package:the_coffee_house/app/screens/setting/setting_state.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';
import 'package:the_coffee_house/app/widgets/buttons/tab_other_button.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseLayoutState<SettingScreen,
    SettingScreenBloc, SettingScreenState> {
  _SettingScreenState() {
    bloc = SettingScreenBloc();
    bloc?.add(FetchDataEvent());
  }

  @override
  String get title => 'Setting Screen';

  @override
  AppBar? buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      centerTitle: true,
      elevation: 0.5,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: theme.colorScheme.onBackground,
          size: 20.0,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        LocaleKeys.title_setting.tr(),
        style: theme.textTheme.subtitle2,
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      color: theme.splashColor,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Card(
            elevation: 0.3,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            color: theme.colorScheme.background,
            child: Container(
              height: MediaQuery.of(context).size.height * .19,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabOtherButton(
                    iconButton: Icons.notifications,
                    contentButton: LocaleKeys.title_notificationSetting.tr(),
                    isButton: false,
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.0,
                    indent: 17.0,
                  ),
                  TabOtherButton(
                    iconButton: Icons.link_outlined,
                    contentButton: LocaleKeys.title_accountLink.tr(),
                    isButton: false,
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.0,
                    indent: 17.0,
                  ),
                  TabOtherButton(
                    iconButton: Icons.info_outline,
                    contentButton: LocaleKeys.title_aboutUs.tr(),
                    isButton: false,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
          ),
          Card(
            elevation: 0.3,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
            color: theme.colorScheme.background,
            child: Container(
              height: MediaQuery.of(context).size.height * .13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SwitchListTile(
                    contentPadding: const EdgeInsets.only(left: 17.0),
                    title: Text(
                      LocaleKeys.button_btnDarkTheme.tr(),
                      style:
                          theme.textTheme.bodyText2?.copyWith(fontSize: 15.0),
                    ),
                    onChanged: (bool value) {
                      appBloc?.add(ChangeAppThemeEvent(
                        appTheme == ThemeType.Dark
                            ? ThemeType.Light
                            : ThemeType.Dark,
                      ),);
                    },
                    value: appTheme == ThemeType.Dark ? true : false,
                    activeColor: theme.colorScheme.primary,
                    activeTrackColor: Color(0xFFF8DCBE),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1.0,
                    indent: 17.0,
                  ),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.only(left: 17.0),
                    title: Text(
                      LocaleKeys.button_btnLanguage.tr(),
                      style:
                          theme.textTheme.bodyText2?.copyWith(fontSize: 15.0),
                    ),
                    onChanged: (bool value) {
                      context.setLocale(context.locale.languageCode == 'en'
                          ? Locale('vi')
                          : Locale('en'));
                    },
                    value: context.locale.languageCode == 'en' ? true : false,
                    activeThumbImage: AssetImage(Assets.iconEnglish),
                    inactiveThumbImage: AssetImage(Assets.iconVietnam),
                    inactiveTrackColor: Color(0xFFF8DCBE),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
          ),
          Text(
            '1.0.1 - TB',
            style: theme.primaryTextTheme.caption,
          ),
        ],
      ),
    );
  }
}
