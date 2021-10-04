import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_dialog/base_dialog_state.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_state.dart';
import 'package:the_coffee_house/app/screens/product_detail/sub_product_detail/body_product_detail.dart';
import 'package:the_coffee_house/app/screens/product_detail/sub_product_detail/footer_product_detail.dart';
import 'package:the_coffee_house/app/screens/product_detail/sub_product_detail/header_product_detail.dart';
import 'package:the_coffee_house/app/styles/app_theme.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

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
  }

  final OrderEntity orderEntity;
  final ScrollController scrollControl;
  final bool isOrder;

  int? get _quantity => state?.quantity;
  CartBloc get cartBloc => BlocProvider.of<CartBloc>(context);

  @override
  Widget buildDialogContent(BuildContext context) {
    if (appTheme == ThemeType.Dark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
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
          child: SingleChildScrollView(
            controller: scrollControl,
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => bloc?.decrementQuantity(isOrder),
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
                        onTap: () => bloc?.incrementQuantity(),
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
                        if (isOrder == true && _quantity == 0) {
                          cartBloc.deleteAllBill();
                        } else if (isOrder == true) {
                          cartBloc.updateOrderItem(bloc?.orderItem);
                        } else {
                          cartBloc.addNewBillItem(bloc?.orderItem);
                        }
                        Navigator.pop(context);
                      },
                      child: (isOrder == true && _quantity == 0)
                          ? Text(
                              'Bỏ chọn sản phẩm này',
                              style: theme.textTheme.subtitle2?.copyWith(
                                  color: theme.backgroundColor, fontSize: 16.0),
                            )
                          : Text(
                              'Chọn sản phẩm - ${NumberFormat.currency(
                                locale: 'vi',
                                symbol: 'đ',
                              ).format(bloc?.orderItem.totalPayment)}',
                              style: theme.textTheme.subtitle2?.copyWith(
                                  color: theme.backgroundColor, fontSize: 16.0),
                            ),
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.all(15.0),
                        primary: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
