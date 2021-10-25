import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/widgets/buttons/dynamic_button.dart';
import 'package:the_coffee_house/app/widgets/buttons/slide_button.dart';
import 'package:the_coffee_house/app/widgets/function_widget/show_product_detail_popup.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        List<OrderEntity>? orderEntities = state.orderEntities ?? [];
        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Container(
                color: theme.colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10.0, 17.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.title_selectedProducts.tr(),
                        style: theme.textTheme.subtitle2?.copyWith(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      DynamicButton(
                        contentButton: '+ ${LocaleKeys.button_btnAdd.tr()}',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              ),
              if (orderEntities.isNotEmpty == true)
                ExpandableNotifier(
                  child: Column(
                    children: [
                      Expandable(
                        collapsed: Column(
                          children: [
                            ...orderEntities.take(3).map((e) =>
                                _buildProduct(context, e, orderEntities)),
                          ],
                        ),
                        expanded: Column(
                          children: [
                            ...orderEntities.map((e) =>
                                _buildProduct(context, e, orderEntities)),
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
                                var controller = ExpandableController.of(
                                    context,
                                    required: true);
                                return InkWell(
                                  onTap: () => controller?.toggle(),
                                  splashColor: Colors.transparent,
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .055,
                                    color: theme.colorScheme.background,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller!.expanded
                                                ? LocaleKeys
                                                    .button_btnViewLessOrder
                                                    .tr()
                                                : LocaleKeys
                                                    .button_btnViewMoreOrder
                                                    .tr(),
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
            ],
          ),
        );
      },
    );
  }

  Widget _buildProduct(BuildContext context, OrderEntity orderItem,
      List<OrderEntity> orderEntities) {
    ThemeData theme = Theme.of(context);
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: .2,
      secondaryActions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 3.0, 8.0, 3.0),
          child: SlideButton(
            contentButton: LocaleKeys.button_btnChange.tr().toUpperCase(),
            colorButton: theme.unselectedWidgetColor,
            iconButton: Icons.border_color,
            onPressed: () => showProductDetailPopup(context, orderItem, true),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 3.0, 16.0, 3.0),
          child: SlideButton(
            contentButton: LocaleKeys.button_btnRemove.tr(),
            colorButton: Color(0xFFE40000),
            iconButton: Icons.delete_rounded,
            onPressed: () => cartBloc.deleteOrderItem(orderItem),
          ),
        ),
      ],
      child: Container(
        color: theme.colorScheme.background,
        child: Column(
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
                      onTap: () =>
                          showProductDetailPopup(context, orderItem, true),
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
        ),
      ),
    );
  }
}
