import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_order_screen/popup_select_order.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';

class AppBarOrder extends StatelessWidget {
  const AppBarOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showPopupSelectOrder(context);
      },
      child: Container(
        height: size.height * .055,
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIcon(
              3,
              Color(0xffd8f0f8),
              Icons.delivery_dining,
              Color(0xff79cce9),
            ),
            Padding(padding: const EdgeInsets.only(right: 12)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Giao đến',
                      style: theme.textTheme.bodyText1,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 1.5)),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    'Các món sẽ được giao đến địa chỉ của bạn',
                    style: theme.textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
