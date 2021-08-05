import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderWithSearch extends StatelessWidget {
  const OrderWithSearch({
    Key? key,
    required this.size,
    required this.theme,
  }) : super(key: key);

  final Size size;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .075,
      padding: const EdgeInsets.only(left: 12, right: 12),
      color: theme.selectedRowColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 35,
              width: size.width * .7,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Thực đơn',
                    style: theme.textTheme.caption,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 1.3,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * .09,
              height: 35,
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.search_rounded,
                size: 17,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * .09,
              height: 35,
              decoration: BoxDecoration(
                color: theme.highlightColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                FontAwesomeIcons.heart,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
