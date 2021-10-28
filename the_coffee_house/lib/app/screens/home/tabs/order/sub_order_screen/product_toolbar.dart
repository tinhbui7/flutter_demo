import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_cubit.dart';
import 'package:the_coffee_house/domain/entities/section_entity.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductToolbar extends StatelessWidget {
  ProductToolbar({
    Key? key,
    required this.itemScrollController,
    required this.itemPositionsListener,
    required this.listSection,
  }) : super(key: key);

  final ItemScrollController itemScrollController;
  final ItemPositionsListener itemPositionsListener;
  final List<SectionEntity> listSection;
  final OrderTabCubit orderTabCubit = OrderTabCubit(0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
      height: size.height * .075,
      padding: const EdgeInsets.only(left: 12, right: 12),
      color: theme.splashColor,
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
                color: theme.disabledColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ValueListenableBuilder<Iterable<ItemPosition>>(
                    valueListenable: itemPositionsListener.itemPositions,
                    builder: (context, positions, child) {
                      orderTabCubit.sectionItem(positions);
                      return BlocBuilder<OrderTabCubit, int>(
                        bloc: orderTabCubit,
                        builder: (context, index) => Text(
                          '${listSection.isNotEmpty == true ? listSection[index].name : LocaleKeys.text_menuSelect.tr()}',
                          style: theme.primaryTextTheme.caption
                              ?.copyWith(fontSize: 12.0),
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 1.3,
                        ),
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
                color: theme.disabledColor,
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
                color: theme.disabledColor,
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
      shape: const RoundedRectangleBorder(
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
              top: const Radius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    heightFactor: 2.7,
                    child: Text(
                      LocaleKeys.text_menuSelect.tr(),
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.clear_rounded,
                        color: theme.colorScheme.onBackground,
                      ),
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
                      color: theme.splashColor,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 10.0, bottom: 35.0),
                      child: Wrap(
                        clipBehavior: Clip.antiAlias,
                        alignment: WrapAlignment.center,
                        children: [
                          ...listSection
                              .asMap()
                              .map(
                                (index, e) => MapEntry(
                                  index,
                                  _cardSection(context, e, index),
                                ),
                              )
                              .values
                              .toList(),
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

  Widget _cardSection(BuildContext context, SectionEntity item, int index) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        itemScrollController.jumpTo(index: index);
        Navigator.pop(context);
      },
      child: Card(
        elevation: 0.3,
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(9.0),
          ),
        ),
        color: theme.backgroundColor,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: const EdgeInsets.all(9.0),
          height: MediaQuery.of(context).size.height * .09,
          width: MediaQuery.of(context).size.width * .45,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: item.lstProduct![0].imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Image.asset(Assets.picturePlaceHolder),
                  errorWidget: (context, url, error) =>
                      Image.asset(Assets.picturePlaceHolder),
                ),
              ),
              Padding(padding: const EdgeInsets.only(left: 10.0)),
              Expanded(
                child: Text(
                  item.name!,
                  style: theme.textTheme.subtitle2?.copyWith(fontSize: 14.5),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
