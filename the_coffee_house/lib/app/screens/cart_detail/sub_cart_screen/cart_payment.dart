import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

class CartPayment extends StatelessWidget {
  const CartPayment({Key? key})
      : super(
          key: key,
        );

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
              LocaleKeys.title_payment.tr(),
              style: theme.textTheme.titleSmall
                  ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 23.0, 15.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.button_btnPaymentMethod.tr(),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.secondary),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 17.0,
                    color: theme.colorScheme.onBackground,
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
