import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_screen/popup_select_order.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';

import '../home_base_content_layout.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({Key? key}) : super(key: key);

  @override
  _OrderTabScreenState createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends HomeBaseContentLayoutState<OrderTabScreen,
    OrderTabBloc, OrderTabState> {
  @override
  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showPopupSelectOrder(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .075,
              padding: const EdgeInsets.only(left: 15, right: 15),
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
                            style: theme.textTheme.subtitle1,
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 3)),
                      Container(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Text(
                          'Các món sẽ được giao đến địa chỉ của bạn',
                          style: theme.textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 0,
          ),
        ],
      ),
    );
  }
}
