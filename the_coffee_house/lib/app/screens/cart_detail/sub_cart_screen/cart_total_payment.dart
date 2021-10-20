import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';

class CartTotalPayment extends StatelessWidget {
  const CartTotalPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        color: theme.colorScheme.background,
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tổng cộng',
              style: theme.textTheme.subtitle2
                  ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 23.0, 15.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thành tiền'),
                  Text('${NumberFormat.currency(
                    locale: 'vi',
                    symbol: 'đ',
                  ).format(cartBloc.totalPayment)}'),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chọn khuyến mãi',
                    style: theme.textTheme.bodyText2
                        ?.copyWith(color: theme.accentColor),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 17.0,
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
              thickness: 1.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Số tiền thanh toán',
                    style: theme.textTheme.subtitle2?.copyWith(fontSize: 15.0),
                  ),
                  Text(
                    '${NumberFormat.currency(
                      locale: 'vi',
                      symbol: 'đ',
                    ).format(cartBloc.totalPayment)}',
                    style: theme.textTheme.subtitle2?.copyWith(fontSize: 15.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
