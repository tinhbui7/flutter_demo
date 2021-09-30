import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/domain/entities/section_entity.dart';
import 'package:the_coffee_house/app/constants/assets.dart';

class OrderWithSearch extends StatelessWidget {
  const OrderWithSearch({
    Key? key,
    required this.itemPositionsListener,
    required this.listSection,
  }) : super(key: key);

  final ItemPositionsListener itemPositionsListener;
  final List<SectionEntity> listSection;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    OrderTabBloc orderTabBloc = BlocProvider.of<OrderTabBloc>(context);
    return Container(
      height: size.height * .075,
      padding: const EdgeInsets.only(left: 12, right: 12),
      color: theme.selectedRowColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => _showSectionItem(context),
            child: Container(
              height: 35,
              width: size.width * .7,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ValueListenableBuilder<Iterable<ItemPosition>>(
                    valueListenable: itemPositionsListener.itemPositions,
                    builder: (context, positions, child) {
                      orderTabBloc.sectionItems(positions);
                      return BlocBuilder<OrderTabBloc, OrderTabState>(
                        builder: (context, state) {
                          return Text(
                            '${state.itemSection ?? 'Thực đơn'}',
                            style: theme.textTheme.caption,
                            overflow: TextOverflow.ellipsis,
                            textScaleFactor: 1.3,
                          );
                        },
                      );
                    },
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * .09,
              height: 35,
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.search_rounded,
                size: 17,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * .09,
              height: 35,
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.favorite_border,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _showSectionItem(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: const Radius.circular(15.0),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: const Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    child: Text(
                      'Thực đơn',
                      style: theme.textTheme.subtitle2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.clear_rounded),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 0,
                thickness: 1.0,
              ),
              (listSection.isNotEmpty == true)
                  ? Container(
                      color: theme.selectedRowColor,
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          ...listSection.map((e) => _cardSection(context, e)),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  Widget _cardSection(BuildContext context, SectionEntity item) {
    ThemeData theme = Theme.of(context);
    return Card(
      elevation: 0.3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.0),
      ),
      color: theme.backgroundColor,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        width: MediaQuery.of(context).size.width * .45,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3.0),
              child: CachedNetworkImage(
                imageUrl: item.lstProduct![0].imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset(Assets.picturePlaceHolder),
                errorWidget: (context, url, error) =>
                    Image.asset(Assets.picturePlaceHolder),
              ),
            ),
            Expanded(
              child: Text(
                item.name!,
                style: theme.textTheme.bodyText1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
