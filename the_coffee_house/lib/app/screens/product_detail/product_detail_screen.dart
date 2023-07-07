import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_events.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_dialog/base_dialog_state.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_events.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_state.dart';
import 'package:the_coffee_house/app/screens/product_detail/sub_product_detail/body_product_detail.dart';
import 'package:the_coffee_house/app/screens/product_detail/sub_product_detail/footer_product_detail.dart';
import 'package:the_coffee_house/app/screens/product_detail/sub_product_detail/header_product_detail.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.orderEntity,
    required this.scrollControl,
    required this.isOrder,
  }) : super(key: key);

  final OrderEntity orderEntity;
  final ScrollController scrollControl;
  final bool isOrder;

  @override
  _ProductDetailScreenState createState() =>
      _ProductDetailScreenState(orderEntity, scrollControl, isOrder);
}

class _ProductDetailScreenState extends BaseDialogState<ProductDetailScreen,
    ProductDetailBloc, ProductDetailState> {
  _ProductDetailScreenState(
      this.orderEntity, this.scrollControl, this.isOrder) {
    bloc = ProductDetailBloc(orderEntity: orderEntity);
    // bloc?.fetchData();
  }

  final OrderEntity orderEntity;
  final ScrollController scrollControl;
  final bool isOrder;

  int? get _quantity => state?.quantity;
  CartBloc get cartBloc => BlocProvider.of<CartBloc>(context);

  @override
  Widget buildDialogContent(BuildContext context) {
    // if (appTheme == ThemeType.Dark) {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 11,
          fit: FlexFit.tight,
          child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowGlow();
                return true;
              },
              child: BlocProvider<ProductDetailBloc>.value(
                value: bloc!,
                child: ListView(
                  controller: scrollControl,
                  shrinkWrap: true,
                  children: [
                    if (orderEntity.product != null) ...[
                      HeaderProductDetail(products: orderEntity.product!),
                      BodyProductDetail(
                        products: orderEntity.product!,
                        orderEntity: orderEntity,
                      ),
                      FooterProductDetail(),
                    ]
                  ],
                ),
              )),
        ),
        Flexible(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: theme.splashColor)),
            ),
            child: SingleChildScrollView(
              controller: scrollControl,
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => bloc?.add(
                            DecrementQuantityEvent(
                              isOrder,
                            ),
                          ),
                          splashColor: Colors.transparent,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: theme.splashColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            '$_quantity',
                            style: theme.textTheme.subtitle2
                                ?.copyWith(fontSize: 17.0),
                          ),
                        ),
                        InkWell(
                          onTap: () => bloc?.add(IncrementQuantityEvent()),
                          splashColor: Colors.transparent,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: theme.splashColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17.0, 3.0, 17.0, 17.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final orderItem = bloc?.orderItem;
                          if (orderItem == null) {
                            return;
                          }
                          if (isOrder == true && _quantity == 0) {
                            cartBloc.add(
                              DeleteOrderItemEvent(orderItem),
                            );
                          } else if (isOrder == true) {
                            cartBloc.add(
                              UpdateOrderItemEvent(orderItem),
                            );
                          } else {
                            cartBloc.add(
                              AddNewBillEvent(orderItem),
                            );
                          }
                          Navigator.pop(context);
                        },
                        child: (isOrder == true && _quantity == 0)
                            ? Text(
                                LocaleKeys.text_uncheckProduct.tr(),
                                style: theme.textTheme.subtitle2?.copyWith(
                                    color: theme.backgroundColor,
                                    fontSize: 16.0),
                              )
                            : Text(
                                '${LocaleKeys.text_chooseProduct.tr()} - ${NumberFormat.currency(
                                  locale: 'vi',
                                  symbol: 'đ',
                                ).format(bloc?.orderItem.totalPayment)}',
                                style: theme.textTheme.subtitle2?.copyWith(
                                    color: theme.backgroundColor,
                                    fontSize: 16.0),
                              ),
                        style: OutlinedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(15.0),
                          primary: theme.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
