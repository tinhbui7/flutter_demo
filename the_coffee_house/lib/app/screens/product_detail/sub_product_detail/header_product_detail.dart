import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:readmore/readmore.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/domain/entities/product_entity.dart';

class HeaderProductDetail extends StatelessWidget {
  const HeaderProductDetail({
    Key? key,
    required this.products,
  }) : super(key: key);

  final ProductEntity products;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
}
