import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_order_screen/list_product.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_order_screen/product_toolbar.dart';
import 'package:the_coffee_house/domain/domain.dart';

import '../../../base_layout/base_content/home_base_content_layout.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({Key? key}) : super(key: key);

  @override
  _OrderTabScreenState createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends HomeBaseContentLayoutState<OrderTabScreen,
    OrderTabBloc, OrderTabState> {
  _OrderTabScreenState();

  OrderTabBloc? get bloc => orderBloc;

  List<SectionEntity> get products => state?.products ?? [];
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProductToolbar(
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            listSection: products,
          ),
          Divider(
            height: 0,
            thickness: 1,
          ),
          ListProduct(
            listSection: products,
            itemPositionsListener: itemPositionsListener,
            itemScrollController: itemScrollController,
          ),
        ],
      ),
    );
  }
}
