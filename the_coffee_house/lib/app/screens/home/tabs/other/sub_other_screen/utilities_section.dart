import 'package:flutter/material.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class UtilitiesSection extends StatelessWidget {
  const UtilitiesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 14.0),
          child: Text(
            LocaleKeys.title_utilities.tr(),
            style: theme.textTheme.subtitle2,
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 3.0)),
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .11,
            padding: const EdgeInsets.all(17.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.description_outlined,
                  color: theme.colorScheme.primary,
                  size: 27.0,
                ),
                Text(LocaleKeys.title_orderHistory.tr()),
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 1.0)),
        Row(
          children: [
            Expanded(
              child: Card(
                elevation: 0.3,
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                color: theme.colorScheme.background,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .11,
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.library_music_outlined,
                        color: Color(0xFF73D13D),
                        size: 27.0,
                      ),
                      Text(LocaleKeys.title_musicPlay.tr()),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 1.0)),
            Expanded(
              child: Card(
                elevation: 0.3,
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                color: theme.colorScheme.background,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .11,
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.admin_panel_settings_outlined,
                        color: Color(0xFFAD76EA),
                        size: 27.0,
                      ),
                      Text(LocaleKeys.title_rules.tr()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
