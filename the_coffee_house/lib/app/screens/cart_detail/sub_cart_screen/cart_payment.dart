import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartPayment extends StatelessWidget {
  const CartPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        color: theme.colorScheme.background,
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 0.0, 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thanh toán',
              style: theme.textTheme.subtitle2
                  ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 23.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bấm để chọn phương thức thanh toán',
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
          ],
        ),
      ),
    );
  }
}
