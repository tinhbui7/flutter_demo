import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalLine extends StatelessWidget {
  final String contentLine;
  final double? thicknessLine;
  final Color? colorLine;

  HorizontalLine(
      {required this.contentLine, this.thicknessLine, this.colorLine});

  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: colorLine,
            thickness: thicknessLine,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(contentLine),
        ),
        Expanded(
          child: Divider(
            color: colorLine,
            thickness: thicknessLine,
          ),
        ),
      ],
    );
  }
}
