import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/blocs/app/app_events.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_dialog/base_dialog_state.dart';
import 'package:the_coffee_house/app/screens/login/login_dialog_bloc.dart';
import 'package:the_coffee_house/app/screens/login/login_dialog_state.dart';
import 'package:the_coffee_house/app/styled_widgets/horizontal_line.dart';
import 'package:the_coffee_house/app/styled_widgets/login_text_field.dart';
import 'package:the_coffee_house/app/styles/theme_button.dart';
import 'package:the_coffee_house/app/widgets/buttons/app_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'login_dialog_events.dart';

class LoginDialogScreen extends StatefulWidget {
  const LoginDialogScreen({Key? key}) : super(key: key);

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends BaseDialogState<LoginDialogScreen,
    LoginDialogBloc, LoginDialogState> {
  _LoginDialogState() {
    bloc = LoginDialogBloc();
  }
  bool get isCheckInput => state?.isCheckInput == true;
  late String textInput;

  @override
  Widget buildDialogContent(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            Assets.backgroundLogin,
            height: 350,
          ),
        ),
        Positioned(
          top: 300,
          child: Container(
            padding: EdgeInsets.only(top: 39, left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 300,
            decoration: BoxDecoration(
              color: theme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.title_tittleLogin.tr(),
                    style: theme.textTheme.subtitle2,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 9)),
                  Image.asset(
                    Assets.logoHorizontal,
                    width: 220,
                    color: theme.colorScheme.onBackground,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 35)),
                  LoginTextField((text) {
                    bloc?.add(CheckPhoneNumberEvent(text));
                    textInput = text;
                  }),
                  Padding(padding: const EdgeInsets.only(top: 15)),
                  Theme(
                    data: isCheckInput
                        ? ThemeButton.buildPrimaryThemeButton(context)
                        : ThemeButton.buildPrimaryDisableThemeButton(context),
                    child: AppElevatedButton(
                      contentButton: LocaleKeys.button_btnLogin.tr(),
                      onPressed: () {
                        if (isCheckInput) {
                          appBloc?.add(ChangeLoginStatusEvent(true));
                          Navigator.of(context).pop(RouteNames.HOME);
                        }
                      },
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 45)),
                  HorizontalLine(
                    contentLine: LocaleKeys.title_orLine.tr(),
                    thicknessLine: 1,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 45)),
                  Theme(
                    data: ThemeButton.buildBlueThemeButton(context),
                    child: AppElevatedButton(
                      contentButton: LocaleKeys.button_btnFacebook.tr(),
                      icon: FontAwesomeIcons.facebook,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 10)),
                  Theme(
                    data: ThemeButton.buildWhiteThemeButton(context),
                    child: AppElevatedButton(
                      contentButton: LocaleKeys.button_btnGoogle.tr(),
                      icon: FontAwesomeIcons.google,
                      borderSide: BorderSide(
                        width: 1,
                        color: theme.splashColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
