import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/cart_detail/sub_cart_screen/cart_product.dart';

import 'sub_cart_screen/order_method.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
    required this.scrollControl,
  }) : super(key: key);

  final ScrollController scrollControl;

  @override
  _CartScreenState createState() => _CartScreenState(scrollControl);
}

class _CartScreenState
    extends BaseLayoutState<CartScreen, CartBloc, CartState> {
  _CartScreenState(this.scrollControl);

  final ScrollController scrollControl;
  CartBloc? get bloc => cartBloc;

  @override
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: theme.backgroundColor,
      elevation: 1.0,
      toolbarHeight: MediaQuery.of(context).size.height * .056,
      automaticallyImplyLeading: false,
      title: Text(
        'Xác nhận đơn hàng',
        style: theme.textTheme.subtitle1,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.clear_rounded,
            color: theme.colorScheme.onBackground,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if (state.orderEntities?.isEmpty == true) {
          Navigator.pop(context);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 9,
            fit: FlexFit.tight,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return true;
              },
              child: BlocProvider<CartBloc>.value(
                value: bloc!,
                child: ListView(
                  shrinkWrap: true,
                  controller: scrollControl,
                  children: [
                    Container(
                      color: theme.splashColor,
                      height: 16.0,
                    ),
                    OrderMethod(),
                    CartProduct(),
                    Container(
                      color: theme.splashColor,
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: _buildFooter(),
          )
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      color: theme.colorScheme.primary,
      child: SingleChildScrollView(
        controller: scrollControl,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(32.0, 15.0, 15.0, 17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Tự đến lấy ',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: theme.colorScheme.background,
                        fontSize: 16.0,
                      ),
                    ),
                    Icon(
                      Icons.circle,
                      size: 6.0,
                      color: theme.colorScheme.background,
                    ),
                    Text(
                      ' ${bloc?.totalQuantity} sản phẩm',
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: theme.colorScheme.background,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${NumberFormat.currency(
                    locale: 'vi',
                    symbol: 'đ',
                  ).format(bloc?.totalPayment)}',
                  style: theme.textTheme.subtitle1?.copyWith(
                    color: theme.colorScheme.background,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'ĐẶT HÀNG',
                style: theme.textTheme.bodyText2?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 1.5,
                primary: theme.colorScheme.background,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
