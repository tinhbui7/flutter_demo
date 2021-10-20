import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_screen.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

Future showProductDetailPopup(
    BuildContext context, OrderEntity orderEntity, bool isOrder) {
  var topPadding = 1 -
      (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top /
          MediaQuery.of(context).size.height);
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
            orderEntity: orderEntity,
            scrollControl: scrollController,
            isOrder: isOrder,
          ),
        );
      },
    ),
  );
}
