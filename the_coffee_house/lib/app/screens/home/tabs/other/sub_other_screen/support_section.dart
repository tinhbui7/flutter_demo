import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/widgets/buttons/tab_other_button.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 35.0),
          child: Text(
            LocaleKeys.title_support.tr(),
            style: theme.textTheme.subtitle2,
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 10.0)),
        Card(
          elevation: 0.3,
          shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          color: theme.colorScheme.background,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: MediaQuery.of(context).size.height * .13,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabOtherButton(
                  iconButton: Icons.star_border_outlined,
                  contentButton: LocaleKeys.title_orderEvaluation.tr(),
                ),
                Divider(
                  height: 0,
                  thickness: 1.0,
                  indent: 17.0,
                ),
                TabOtherButton(
                  iconButton: Icons.chat_bubble_outline,
                  contentButton: LocaleKeys.title_contactComment.tr(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
