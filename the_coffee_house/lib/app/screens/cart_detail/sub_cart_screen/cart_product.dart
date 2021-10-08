import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_screen.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<OrderEntity>? orderEntities = state.orderEntities ?? [];
        return Column(
          children: [
            Divider(
              height: 0,
              thickness: 16.0,
              color: theme.splashColor,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 17.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Các sản phẩm đã chọn',
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color(0xFFFFF7E6),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      '+ Thêm',
                      style: theme.textTheme.bodyText1?.copyWith(
                          fontSize: 11.0, color: theme.colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
            if (orderEntities.isNotEmpty == true)
              ExpandableNotifier(
                child: Column(
                  children: [
                    Expandable(
                      collapsed: Column(
                        children: [
                          ...orderEntities.take(3).map(
                              (e) => _buildProduct(context, e, orderEntities)),
                        ],
                      ),
                      expanded: Column(
                        children: [
                          ...orderEntities.map(
                              (e) => _buildProduct(context, e, orderEntities)),
                        ],
                      ),
                    ),
                    if (orderEntities.length > 3)
                      Column(
                        children: [
                          Divider(
                            height: 0,
                            thickness: 1,
                          ),
                          Builder(
                            builder: (context) {
                              var controller = ExpandableController.of(context,
                                  required: true);
                              return InkWell(
                                onTap: () => controller?.toggle(),
                                splashColor: Colors.transparent,
                                child: SizedBox(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .05,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller!.expanded
                                              ? 'Rút gọn đơn hàng'
                                              : 'Xem đầy đủ đơn hàng',
                                          style: theme.textTheme.subtitle2
                                              ?.copyWith(
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        ExpandableIcon(
                                          theme: const ExpandableThemeData(
                                            expandIcon: Icons.expand_more,
                                            collapseIcon: Icons.expand_less,
                                            iconSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            Padding(padding: const EdgeInsets.only(bottom: 10.0)),
          ],
        );
      },
    );
  }

  Widget _buildProduct(BuildContext context, OrderEntity orderItem,
      List<OrderEntity> orderEntities) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        if (orderEntities.first != orderItem)
          Divider(
            height: 0,
            thickness: 1,
            indent: MediaQuery.of(context).size.width * .13,
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(17.0, 10.0, 16.0, 13.0),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.border_color,
                    size: 16.0,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                fit: FlexFit.tight,
                child: InkWell(
                  onTap: () => _showProductDetailPopup(context, orderItem),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(
                                '${orderItem.quantity}x ${orderItem.product?.name}',
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.subtitle2?.copyWith(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                          Text('${NumberFormat.currency(
                            locale: 'vi',
                            symbol: 'đ',
                          ).format(orderItem.totalPayment)}'),
                        ],
                      ),
                      Padding(padding: const EdgeInsets.only(top: 5.0)),
                      Text(
                        '${orderItem.size?.name}',
                        style: theme.primaryTextTheme.caption
                            ?.copyWith(fontSize: 12.5),
                      ),
                      if (orderItem.topping?.isNotEmpty == true) ...[
                        ...orderItem.topping!.map(
                          (e) => Text(
                            '${e.name}',
                            style: theme.primaryTextTheme.caption
                                ?.copyWith(fontSize: 12.5),
                          ),
                        ),
                      ],
                      if (orderItem.note?.isNotEmpty == true)
                        Text(
                          '${orderItem.note}',
                          style: theme.primaryTextTheme.caption
                              ?.copyWith(fontSize: 12.5),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future _showProductDetailPopup(BuildContext context, OrderEntity item) {
    var topPadding = 1 -
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .padding
                .top /
            MediaQuery.of(context).size.height);
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: const Radius.circular(20.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: topPadding,
        maxChildSize: topPadding,
        minChildSize: 0,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: const Radius.circular(20.0),
              ),
            ),
            child: ProductDetailScreen(
              orderEntity: item,
              scrollControl: scrollController,
              isOrder: true,
            ),
          );
        },
      ),
    );
  }
}
