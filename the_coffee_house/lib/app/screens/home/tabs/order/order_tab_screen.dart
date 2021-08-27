import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_screen/list_product.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_screen/order_with_search.dart';
import 'package:the_coffee_house/domain/domain.dart';

import '../home_base_content_layout.dart';
import 'sub_screen/app_bar_order.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({Key? key}) : super(key: key);

  @override
  _OrderTabScreenState createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends HomeBaseContentLayoutState<OrderTabScreen,
    OrderTabBloc, OrderTabState> {
  _OrderTabScreenState() {
    bloc = OrderTabBloc();
    bloc?.loadProduct();
  }

  List<SectionEntity> get products => state?.products ?? [];

  @override
  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBarOrder(),
          OrderWithSearch(),
          Divider(
            height: 0,
            thickness: 1,
          ),
          ListProduct(
            listSection: products,
          ),
        ],
      ),
    );
  }
}
