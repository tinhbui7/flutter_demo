import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/app/app_bloc.dart';
import 'package:the_coffee_house/app/blocs/app/app_state.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/home_slider.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/news_discovery.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/sub_home_screen/option_order_button.dart';
import 'package:the_coffee_house/app/screens/login/login_dialog_screen.dart';
import 'package:the_coffee_house/app/widgets/content/member_card.dart';

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
    // bloc?.fetchData();
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
            flexibleSpace: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Color(0xFFFFF7E6),
                    ),
                    if (state.isLogin == true) ...[
                      Positioned(
                        child: Image.asset(
                          Assets.homeBackground,
                          fit: BoxFit.cover,
                        ),
                        left: 0,
                        right: 0,
                        bottom: -65,
                      ),
                      Positioned(
                        top: 10,
                        left: 12,
                        right: 12,
                        child: MemberCard(),
                      ),
                    ] else ...[
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .38,
                              ),
                              Positioned(
                                child: Image.asset(
                                  Assets.homeBackground,
                                  fit: BoxFit.cover,
                                ),
                                left: 0,
                                right: 0,
                                bottom: 0,
                              ),
                              Positioned(
                                top: 30,
                                left: 20,
                                right: 20,
                                child: Column(
                                  children: [
                                    Text(
                                      'Đăng nhập',
                                      style: theme.textTheme.subtitle2
                                          ?.copyWith(fontSize: 19.0),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0)),
                                    Text(
                                      'Sử dụng app để tích điểm và đổi những ưu đãi chỉ \n dành riêng cho thành viên bạn nhé !',
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyText2
                                          ?.copyWith(fontSize: 13.5),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0)),
                                    ElevatedButton(
                                      onPressed: () {
                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierLabel:
                                                MaterialLocalizations.of(
                                                        context)
                                                    .modalBarrierDismissLabel,
                                            pageBuilder:
                                                (BuildContext buildContext,
                                                    Animation first,
                                                    Animation second) {
                                              return LoginDialogScreen();
                                            });
                                      },
                                      child: Text('Đăng nhập'),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 42.0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 12,
                                right: 12,
                                bottom: 12,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  elevation: 2,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(9.0),
                                    ),
                                  ),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.width * .13,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('The Coffee House`s Reward'),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                    Positioned(
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.background,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                      ),
                      left: 0,
                      right: 0,
                      bottom: 0,
                    ),
                  ],
                );
              },
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
                    vertical: 0,
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
                NewsDiscovery(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*List<Widget> test() {
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
  }*/
}
