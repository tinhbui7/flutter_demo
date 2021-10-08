import 'package:flutter/material.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';

void showPopupSelectOrder(context) {
  ThemeData theme = Theme.of(context);
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.vertical(
        top: const Radius.circular(10),
      ),
    ),
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * .31,
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: const Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .07,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    child: Text(
                      'Chọn phương thức đặt hàng',
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.clear_rounded,
                        color: theme.colorScheme.onBackground,
                      ),
                      iconSize: 27,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 0,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .12,
              padding: const EdgeInsets.only(top: 17),
              color: theme.selectedRowColor,
              child: ListTile(
                horizontalTitleGap: 7,
                onTap: () {
                  Navigator.of(context).pushNamed(RouteNames.DELIVERY);
                },
                leading: CustomIcon(
                  3,
                  Color(0xffd8f0f8),
                  Icons.delivery_dining,
                  Color(0xff79cce9),
                ),
                title: Text(
                  'Giao tận nơi',
                  style: theme.textTheme.bodyText2,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Các sản phẩm sẽ được giao đến địa chỉ của bạn',
                      style: theme.textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Sun Life 19001001')
                  ],
                ),
                trailing: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'SỬA',
                    style: theme.textTheme.caption,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .12,
              padding: const EdgeInsets.only(top: 17),
              child: ListTile(
                horizontalTitleGap: 7,
                onTap: () {},
                leading: CustomIcon(
                  3,
                  Color(0xffffe2e2),
                  Icons.wine_bar,
                  Color(0xffff8484),
                ),
                title: Text(
                  'Tự đến lấy',
                  style: theme.textTheme.bodyText2,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bạn sẽ đến quầy nhận món tại cửa hàng',
                      style: theme.textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('0.75km'),
                  ],
                ),
                trailing: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'SỬA',
                    style: theme.textTheme.caption,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
