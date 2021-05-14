import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/app/styles/styles.dart';

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
    return Center(
      child: Text(
        'ORDER TAB',
        style: TextStyles.h2,
      ),
    );
  }
}
