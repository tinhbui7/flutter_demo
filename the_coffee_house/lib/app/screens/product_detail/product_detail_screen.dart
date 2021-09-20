import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';
import 'package:collection/collection.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_dialog/base_dialog_state.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_bloc.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.orderEntity,
    required this.scrollControl,
  }) : super(key: key);

  final OrderEntity orderEntity;
  final ScrollController scrollControl;

  @override
  _ProductDetailScreenState createState() =>
      _ProductDetailScreenState(orderEntity, scrollControl);
}

class _ProductDetailScreenState extends BaseDialogState<ProductDetailScreen,
    ProductDetailBloc, ProductDetailState> {
  _ProductDetailScreenState(this.orderEntity, this.scrollControl) {
    bloc = ProductDetailBloc(orderEntity: orderEntity);
  }

  final OrderEntity orderEntity;
  final ScrollController scrollControl;

  SizeEntity? get _selectedSize => state?.selectedSize;
  List<ToppingEntity>? get _selectedTopping => state?.selectedTopping;

  @override
  Widget buildDialogContent(BuildContext context) {
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
            child: ListView(
              controller: scrollControl,
              shrinkWrap: true,
              children: [
                _buildHeader(context, orderEntity.product!),
                _buildBody(context, orderEntity.product!),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, ProductEntity products) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: products.imageUrl!,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(Assets.picturePlaceHolder),
          errorWidget: (context, url, error) =>
              Image.asset(Assets.picturePlaceHolder),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 23.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      products.name!,
                      style:
                          theme.textTheme.headline6?.copyWith(fontSize: 25.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      size: 25,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 17.0),
                child: Text(
                  '${NumberFormat.currency(
                    locale: 'vi',
                    symbol: 'đ',
                  ).format(products.price)}',
                  style: theme.textTheme.caption?.copyWith(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ReadMoreText(
                products.intro!.replaceAll("\\n", "\n"),
                trimLines: 3,
                trimMode: TrimMode.Line,
                colorClickableText: theme.primaryColor,
                trimCollapsedText: 'Xem thêm',
                trimExpandedText: 'Rút gọn',
                style: theme.textTheme.caption?.copyWith(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, ProductEntity products) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (products.sizes?.isNotEmpty == true) ...[
          Divider(
            thickness: 7.5,
            color: theme.selectedRowColor,
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
                    style: theme.textTheme.headline6,
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
                  'Chọn 1 loại size',
                  style: theme.textTheme.caption?.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          ...products.sizes!.map((e) => _buildItemSize(context, e)),
          Padding(padding: const EdgeInsets.only(bottom: 15.0)),
        ],
        if (products.toppings?.isNotEmpty == true) ...[
          Divider(
            thickness: 7.5,
            color: theme.selectedRowColor,
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
                  style: theme.textTheme.headline6,
                ),
                Padding(padding: const EdgeInsets.only(top: 3.0)),
                Text(
                  'Chọn tối đa 2 loại',
                  style: theme.textTheme.caption?.copyWith(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          ...products.toppings!.map((e) => _buildItemTopping(context, e)),
          Padding(padding: const EdgeInsets.only(bottom: 15.0)),
        ],
      ],
    );
  }

  Widget _buildItemSize(BuildContext context, SizeEntity itemSize) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (itemSize != _selectedSize) bloc?.setSizeSelected(itemSize);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                value: itemSize,
                groupValue: _selectedSize,
                onChanged: (SizeEntity? newSize) {
                  bloc?.setSizeSelected(newSize);
                },
                activeColor: theme.primaryColor,
              ),
              Text(
                itemSize.name!,
                style: theme.textTheme.subtitle1,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  itemSize.extraPay.toString(),
                  style: theme.textTheme.caption?.copyWith(fontSize: 15.0),
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

  Widget _buildItemTopping(BuildContext context, ToppingEntity itemTopping) {
    final _isChecked = (_selectedTopping
            ?.firstWhereOrNull((element) => element == itemTopping) !=
        null);
    return Column(
      children: [
        InkWell(
          onTap: () {
            bloc?.setToppingSelected(itemTopping);
          },
          child: Row(
            children: [
              Checkbox(
                activeColor: theme.primaryColor,
                value: _isChecked,
                onChanged: (bool? newValue) {
                  bloc?.setToppingSelected(itemTopping);
                },
              ),
              Text(
                itemTopping.name!,
                style: theme.textTheme.subtitle1,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  itemTopping.extraPay.toString(),
                  style: theme.textTheme.caption?.copyWith(fontSize: 15.0),
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
