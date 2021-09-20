import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';

class OrderWithSearch extends StatelessWidget {
  const OrderWithSearch({
    Key? key,
    required this.itemPositionsListener,
  }) : super(key: key);

  final ItemPositionsListener itemPositionsListener;

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
          GestureDetector(
            onTap: () {},
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
}
