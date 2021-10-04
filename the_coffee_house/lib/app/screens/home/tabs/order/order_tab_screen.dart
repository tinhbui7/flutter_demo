import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_cubit.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_order_screen/list_product.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_order_screen/order_with_search.dart';
import 'package:the_coffee_house/domain/domain.dart';

import '../home_base_content_layout.dart';
import 'sub_order_screen/app_bar_order.dart';

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
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => OrderTabCubit(),
        child: Column(
          children: [
            AppBarOrder(),
            OrderWithSearch(
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
      ),
    );
  }
}
