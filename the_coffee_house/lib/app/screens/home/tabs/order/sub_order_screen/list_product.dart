import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_screen.dart';
import 'package:the_coffee_house/app/widgets/content/content_empty.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class ListProduct extends StatelessWidget {
  ListProduct({
    Key? key,
    required this.listSection,
    required this.itemScrollController,
    required this.itemPositionsListener,
  }) : super(key: key);

  final List<SectionEntity> listSection;
  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;

  @override
  Widget build(BuildContext context) {
    List<ProductEntity> _listProduct = [];
    ThemeData theme = Theme.of(context);
    return Expanded(
      child: Container(
        color: theme.splashColor,
        child: listSection.isNotEmpty == true
            ? ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 7.0),
                itemCount: listSection.length,
                itemBuilder: (context, index) {
                  _listProduct = listSection[index].lstProduct!;
                  return _buildSections(
                    context,
                    listSection[index].name!,
                    _listProduct,
                  );
                },
              )
            : ContentEmpty(),
      ),
    );
  }

  Widget _buildSections(
      BuildContext context, String section, List<ProductEntity> products) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3.0, 19.0, 3.0, 10.0),
          child: Text(
            section,
            style: theme.textTheme.subtitle2?.copyWith(fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        products.isNotEmpty == true
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () =>
                        _showProductDetailPopup(context, products[index]),
                    child: _buildProductItems(
                      context,
                      products[index],
                    ),
                  );
                },
              )
            : ContentEmpty(),
      ],
    );
  }

  Widget _buildProductItems(BuildContext context, ProductEntity item) {
    ThemeData theme = Theme.of(context);
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      closeOnScroll: true,
      secondaryActions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 25.0, 5.0, 25.0),
          child: SlideAction(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: theme.backgroundColor,
                  size: 23.0,
                ),
                Padding(padding: const EdgeInsets.only(top: 10.0)),
                Text(
                  'YÊU THÍCH',
                  style: TextStyle(
                      color: theme.backgroundColor,
                      fontSize: 9.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ],
      child: Card(
        elevation: 0.3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        color: theme.backgroundColor,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: MediaQuery.of(context).size.height * .139,
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name!,
                      style:
                          theme.textTheme.subtitle2?.copyWith(fontSize: 15.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item.intro!,
                      maxLines: 2,
                      style: theme.primaryTextTheme.caption
                          ?.copyWith(fontSize: 13.5),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('${item.price}'),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 15.0)),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Image.asset(Assets.picturePlaceHolder),
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.picturePlaceHolder),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _showProductDetailPopup(
      BuildContext context, ProductEntity contentScreen) {
    var topPadding = 1 -
        MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top /
            900;
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
              orderEntity: OrderEntity(
                  orderId: DateTime.now().millisecondsSinceEpoch,
                  product: contentScreen),
              scrollControl: scrollController,
              isOrder: false,
            ),
          );
        },
      ),
    );
  }
}
