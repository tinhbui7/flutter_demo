import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';

class ListNotifications extends StatelessWidget {
  final entries = [
    'Thông báo mới',
    'Ghé Nhà lấy bữa sáng',
    'Cảm ơn bạn đã ghé Nhà',
  ];
  final images = [
    '',
    Assets.sliderNo3,
    Assets.sliderNo3,
  ];
  final dateTimes = [
    '',
    '2021/05/22 - 20:30',
    '2021/05/20 - 10:26',
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.backgroundColor,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: entries.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              child: Row(
                children: [
                  if (images[index] != '') ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        images[index],
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 10))
                  ],
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entries[index],
                      ),
                      if (dateTimes[index] != '')
                        Text(
                          dateTimes[index],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
