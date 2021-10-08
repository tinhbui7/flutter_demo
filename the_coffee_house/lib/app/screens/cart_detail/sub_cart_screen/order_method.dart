import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderMethod extends StatelessWidget {
  const OrderMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 10.0, 17.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tự đến lấy',
                style: theme.textTheme.subtitle2
                    ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w500),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFF7E6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Thay đổi',
                  style: theme.textTheme.bodyText1?.copyWith(
                    fontSize: 11.0,
                    color: theme.colorScheme.primary,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 13.0),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: 0),
            title: Text(
              'TCH Su Van Hanh',
              style: theme.textTheme.bodyText2,
            ),
            subtitle: Text(
              '789 Sư Vạn Hạnh, Phường 12, Quận 10, Hồ Chí Minh, Vietnam',
              style: theme.primaryTextTheme.caption?.copyWith(fontSize: 12.0),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
            ),
          ),
        ),
        Divider(
          height: 0,
          thickness: 1.0,
          indent: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 20.0),
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: 0),
            title: Text(
              'Ngày mai',
              style: theme.textTheme.bodyText2,
            ),
            subtitle: Text(
              'Sớm nhất có thể',
              style: theme.primaryTextTheme.caption?.copyWith(fontSize: 12.0),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
