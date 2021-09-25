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

  SizeEntity? get _selectedSize => state?.selectedSize;
  List<ToppingEntity>? get _selectedTopping => state?.selectedTopping;
  String? get _noteProduct => state?.noteProduct;
  int? get _quantity => state?.quantity;

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
                if (orderEntity.product != null) ...[
                  _buildHeader(context, orderEntity.product!),
                  _buildBody(context, orderEntity.product!),
                  _buildFooter(context),
                ]
              ],
            ),
          ),
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
                            color: theme.selectedRowColor,
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
                            color: theme.selectedRowColor,
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
                      onPressed: () {},
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
          splashColor: Colors.transparent,
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
                  '${itemSize.extraPay}',
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
          splashColor: Colors.transparent,
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
                  '${itemTopping.extraPay}',
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

  Widget _buildFooter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 7.5,
          color: theme.selectedRowColor,
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yều cầu khác',
                style: theme.textTheme.headline6,
              ),
              Text(
                'Những tuỳ chọn khác',
                style: theme.textTheme.caption?.copyWith(fontSize: 14.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => _showPopupNote(),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: (_noteProduct?.isNotEmpty == true)
                        ? Text(
                            _noteProduct!,
                            style: theme.textTheme.caption
                                ?.copyWith(fontSize: 14.0),
                          )
                        : Text(
                            'Thêm ghi chú',
                            style: theme.textTheme.caption
                                ?.copyWith(fontSize: 14.0),
                          ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(13.0),
                    primary: theme.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future _showPopupNote() {
    var note = TextEditingController();
    note.text = _noteProduct ?? '';
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    child: Text(
                      'Ghi chú sản phẩm',
                      style:
                          theme.textTheme.subtitle2?.copyWith(fontSize: 16.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.clear_rounded),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.0,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: note,
                cursorHeight: 20,
                keyboardType: TextInputType.multiline,
                maxLength: 50,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Thêm ghi chú',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: theme.buttonColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: theme.buttonColor),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (note.text != _noteProduct) {
                      bloc?.setNoteProduct(note.text);
                    }
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    primary: theme.backgroundColor,
                  ),
                  child: Text(
                    'Xong',
                    style: theme.textTheme.subtitle2
                        ?.copyWith(color: theme.accentColor),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
