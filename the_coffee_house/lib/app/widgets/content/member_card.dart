import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/widgets/function_widget/shadow_text.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(12.0),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .27,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3, 0.8, 1],
                colors: [
                  Color(0xFFEED787),
                  Color(0xFFE8AD52),
                  Color(0xFFEDC77A),
                  Color(0xFFC48844)
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: Image.asset(
              Assets.membershipCard,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 15.0,
            child: Container(
              width: MediaQuery.of(context).size.width * .25,
              height: MediaQuery.of(context).size.height * .037,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFCA9761), Color(0xFFBF8140)],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(8.0),
                  bottomRight: const Radius.circular(8.0),
                ),
                border: Border.all(
                  color: Color(0xFFD8AE7C),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.angleDoubleDown,
                    size: 14.0,
                    color: Color(0xFFF1E3D5),
                  ),
                  Text(
                    LocaleKeys.button_btnPoint.tr(),
                    style: theme.textTheme.subtitle2?.copyWith(
                      color: theme.colorScheme.background,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 22.0,
            left: 17.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShadowText(
                  data: 'Tính Bùi',
                  style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 17.0, color: theme.colorScheme.background),
                  color: theme.colorScheme.onBackground,
                ),
                ShadowText(
                  data: '678 BEAN - Vàng',
                  style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 15.0, color: theme.colorScheme.background),
                  color: theme.colorScheme.onBackground,
                ),
              ],
            ),
          ),
          Positioned(
            left: 17.0,
            right: 17.0,
            bottom: 17.0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .13,
              padding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 45.0),
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: BarcodeWidget(
                barcode: Barcode.code128(),
                data: 'M161465476',
                color: theme.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }
}
