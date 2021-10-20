import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/home/home_bloc.dart';
import 'package:the_coffee_house/app/screens/home/home_state.dart';
import 'package:the_coffee_house/app/screens/home/sub_screen/cart_card.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_screen.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_screen.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_order_screen/popup_order_method.dart';
import 'package:the_coffee_house/app/screens/home/tabs/other/other_tab_screen.dart';
import 'package:the_coffee_house/app/screens/home/tabs/point/point_tab_screen.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_screen.dart';
import 'package:the_coffee_house/app/screens/login/login_dialog_screen.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseLayoutState<HomeScreen, HomeScreenBloc, HomeScreenState> {
  _HomeScreenState() {
    bloc = HomeScreenBloc();
  }

  HomeTab get activeTab => state?.activeTab ?? HomeTab.Home;
  PageController pageController = PageController();

  @override
  AppBar? buildAppBar(BuildContext context) {
    return (activeTab == HomeTab.Order)
        ? AppBar(
            backgroundColor: theme.colorScheme.background,
            elevation: 0,
            title: InkWell(
              onTap: () {
                showPopupSelectOrder(context);
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIcon(
                      3,
                      Color(0xffd8f0f8),
                      Icons.delivery_dining,
                      Color(0xff79cce9),
                    ),
                    Padding(padding: const EdgeInsets.only(right: 12)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Giao đến',
                              style: theme.textTheme.subtitle1
                                  ?.copyWith(fontSize: 13.0),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 1.5)),
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text(
                            'Các sản phẩm sẽ được giao đến địa chỉ của bạn',
                            style: theme.primaryTextTheme.caption,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : AppBar(
            backgroundColor: theme.backgroundColor,
            elevation: 0,
            title: Image(
              width: 150,
              fit: BoxFit.contain,
              color: theme.colorScheme.onBackground,
              image: AssetImage(Assets.logoHorizontal),
            ),
            actions: buildHeaderActions(context),
          );
  }

  @override
  List<Widget> buildHeaderActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 13),
        child: IconButton(
          icon: Image.asset(
            Assets.logoPointCard,
            width: 35,
            height: 15,
          ),
          onPressed: () {
            showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel:
                    MaterialLocalizations.of(context).modalBarrierDismissLabel,
                pageBuilder: (BuildContext buildContext, Animation first,
                    Animation second) {
                  return LoginDialogScreen();
                });
          },
        ),
      ),
    ];
  }

  @override
  Widget buildContent(BuildContext context) {
    return Stack(
      children: [
        PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            HomeTabScreen(),
            OrderTabScreen(),
            StoreTabScreen(),
            PointTabScreen(),
            OtherTabScreen(),
          ],
        ),
        if (activeTab == HomeTab.Home || activeTab == HomeTab.Order) CartCard(),
      ],
    );
  }

  @override
  BottomNavigationBar buildBottomBar(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: LocaleKeys.button_btnHome.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_food_beverage),
          label: LocaleKeys.button_btnOrder.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.storefront),
          label: LocaleKeys.button_btnStore.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_play),
          label: LocaleKeys.button_btnPoint.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: LocaleKeys.button_btnOther.tr(),
        ),
      ],
      fixedColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.background,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.0,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 11.0,
      ),
      currentIndex: activeTab.index,
      onTap: (index) {
        bloc?.onItemTab(index);
        Future.delayed(const Duration(milliseconds: 200)).then((value) {
          pageController.jumpToPage(index);
        });
      },
    );
  }
}
