import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OptionOrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * .12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                    5,
                    Color(0xffd8f0f8),
                    Icons.delivery_dining,
                    Color(0xff79cce9),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 15)),
                  Text(
                    LocaleKeys.button_btnDelivery.tr(),
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
            width: 0,
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(
                    5,
                    Color(0xffffe2e2),
                    Icons.wine_bar,
                    Color(0xffff8484),
                  ),
                  Padding(padding: const EdgeInsets.only(top: 15)),
                  Text(
                    LocaleKeys.button_btnPickup.tr(),
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
