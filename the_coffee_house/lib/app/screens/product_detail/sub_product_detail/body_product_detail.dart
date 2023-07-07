import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_events.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';
import 'package:collection/collection.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

class BodyProductDetail extends StatelessWidget {
  const BodyProductDetail({
    Key? key,
    required this.products,
    required this.orderEntity,
  }) : super(key: key);

  final ProductEntity products;
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (products.sizes?.isNotEmpty == true) ...[
              Divider(
                thickness: 7.5,
                color: theme.splashColor,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Size',
                        style: theme.textTheme.subtitle2,
                        children: [
                          TextSpan(
                            text: '*',
                            style: theme.textTheme.subtitle1
                                ?.copyWith(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 3.0)),
                    Text(
                      LocaleKeys.text_chooseSize.tr(),
                      style: theme.primaryTextTheme.caption,
                    ),
                  ],
                ),
              ),
              ...products.sizes!.map((e) => _buildItemSize(
                    context,
                    e,
                    state.selectedSize,
                  )),
              Padding(padding: const EdgeInsets.only(bottom: 15.0)),
            ],
            if (products.toppings?.isNotEmpty == true) ...[
              Divider(
                thickness: 7.5,
                color: theme.splashColor,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Topping',
                      style: theme.textTheme.subtitle2,
                    ),
                    Padding(padding: const EdgeInsets.only(top: 3.0)),
                    Text(
                      LocaleKeys.text_chooseTypes.tr(),
                      style: theme.primaryTextTheme.caption,
                    ),
                  ],
                ),
              ),
              ...products.toppings!.map((e) => _buildItemTopping(
                    context,
                    e,
                    state.selectedTopping,
                  )),
              Padding(padding: const EdgeInsets.only(bottom: 15.0)),
            ],
          ],
        );
      },
    );
  }

  Widget _buildItemSize(
      BuildContext context, SizeEntity itemSize, SizeEntity? selectedSize) {
    ThemeData theme = Theme.of(context);
    ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (itemSize != selectedSize) {
              productDetailBloc.add(
                SelectedSizeEvent(
                  itemSize,
                ),
              );
            }
          },
          splashColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                value: itemSize,
                groupValue: selectedSize,
                onChanged: (SizeEntity? newSize) {
                  if (newSize != null) {
                    productDetailBloc.add(SelectedSizeEvent(newSize));
                  }
                },
                activeColor: theme.primaryColor,
              ),
              Text(
                itemSize.name!,
                style: theme.textTheme.bodyText2?.copyWith(fontSize: 16.0),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '+ ${NumberFormat.currency(
                    locale: 'vi',
                    symbol: 'đ',
                  ).format(itemSize.extraPay)}',
                  style:
                      theme.primaryTextTheme.caption?.copyWith(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
        if (orderEntity.product!.sizes?.last != itemSize)
          Divider(
            height: 7,
            thickness: 1,
            indent: 15.0,
          ),
      ],
    );
  }

  Widget _buildItemTopping(BuildContext context, ToppingEntity itemTopping,
      List<ToppingEntity>? selectedTopping) {
    ThemeData theme = Theme.of(context);
    ProductDetailBloc productDetailBloc =
        BlocProvider.of<ProductDetailBloc>(context);
    final _isChecked = (selectedTopping
            ?.firstWhereOrNull((element) => element == itemTopping) !=
        null);
    return Column(
      children: [
        InkWell(
          onTap: () {
            productDetailBloc.add(
              SelectedToppingEvent(
                itemTopping,
              ),
            );
          },
          splashColor: Colors.transparent,
          child: Row(
            children: [
              Checkbox(
                activeColor: theme.primaryColor,
                value: _isChecked,
                onChanged: (bool? newValue) {
                  productDetailBloc.add(
                    SelectedToppingEvent(
                      itemTopping,
                    ),
                  );
                },
              ),
              Text(
                itemTopping.name!,
                style: theme.textTheme.bodyText2?.copyWith(fontSize: 16.0),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  '+ ${NumberFormat.currency(
                    locale: 'vi',
                    symbol: 'đ',
                  ).format(itemTopping.extraPay)}',
                  style:
                      theme.primaryTextTheme.caption?.copyWith(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
        if (orderEntity.product?.toppings!.last != itemTopping)
          Divider(
            height: 7,
            thickness: 1,
            indent: 15.0,
          ),
      ],
    );
  }
}
