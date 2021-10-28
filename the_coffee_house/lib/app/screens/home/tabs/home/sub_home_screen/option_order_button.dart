import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OptionOrderButton extends StatelessWidget {
  const OptionOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
      height: MediaQuery.of(context).size.height * .11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.backgroundColor,
        border: Border.all(color: theme.disabledColor),
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
                  Image.asset(
                    Assets.deliveryIcon,
                    fit: BoxFit.cover,
                    width: 45.0,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 7)),
                  Text(
                    LocaleKeys.button_btnDeliHome.tr(),
                    style: theme.textTheme.bodyText2?.copyWith(fontSize: 13.0),
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
                  Image.asset(
                    Assets.pickupIcon,
                    fit: BoxFit.cover,
                    width: 45.0,
                  ),
                  Padding(padding: const EdgeInsets.only(top: 7)),
                  Text(
                    LocaleKeys.button_btnPickHome.tr(),
                    style: theme.textTheme.bodyText2?.copyWith(fontSize: 13.0),
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
