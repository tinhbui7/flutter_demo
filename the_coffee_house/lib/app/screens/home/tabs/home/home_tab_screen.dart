import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/home_banner.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/home_slider.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/option_order_button.dart';
import 'package:the_coffee_house/app/widgets/function_widget/shadow_text.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:barcode_widget/barcode_widget.dart';

import '../../../base_layout/base_content/home_base_content_layout.dart';

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
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return true;
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * .44,
            flexibleSpace: Flexible(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    color: Color(0xFFFFF7E6),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                          ),
                        ),
                        Image.asset(
                          Assets.homeBackground,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 12,
                    right: 12,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(12.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .27,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.1, 0.3, 0.8, 1],
                                colors: [
                                  Color(0xFFEED787),
                                  Color(0xFFE8AD52),
                                  Color(0xFFEDC77A),
                                  Color(0xFFC48844)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            child: Image.asset(
                              Assets.membershipCard,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 15.0,
                            child: Container(
                              width: MediaQuery.of(context).size.width * .25,
                              height: MediaQuery.of(context).size.height * .037,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xFFCA9761),
                                    Color(0xFFBF8140)
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: const Radius.circular(8.0),
                                  bottomRight: const Radius.circular(8.0),
                                ),
                                border: Border.all(
                                  color: Color(0xFFD8AE7C),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.angleDoubleDown,
                                    size: 14.0,
                                    color: Color(0xFFF1E3D5),
                                  ),
                                  Text(
                                    LocaleKeys.button_btnPoint.tr(),
                                    style: theme.textTheme.subtitle2?.copyWith(
                                      color: theme.colorScheme.background,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 22.0,
                            left: 17.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShadowText(
                                  data: 'Tính Bùi',
                                  style: theme.textTheme.subtitle2?.copyWith(
                                      fontSize: 17.0,
                                      color: theme.colorScheme.background),
                                  color: theme.colorScheme.onBackground,
                                ),
                                ShadowText(
                                  data: '678 BEAN - Vàng',
                                  style: theme.textTheme.subtitle2?.copyWith(
                                      fontSize: 15.0,
                                      color: theme.colorScheme.background),
                                  color: theme.colorScheme.onBackground,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 17.0,
                            right: 17.0,
                            bottom: 17.0,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * .13,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13.0, horizontal: 45.0),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.background,
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: BarcodeWidget(
                                barcode: Barcode.code128(),
                                data: 'M161465476',
                                color: theme.colorScheme.onBackground,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Container(
                  height: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: MediaQuery.of(context).size.width * .45,
                  ),
                  decoration: BoxDecoration(
                    color: theme.disabledColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                OptionOrderButton(),
                HomeSlider(),
                Padding(padding: const EdgeInsets.only(top: 15)),
                HomeBanner(),
              ],
            ),
          ),
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
