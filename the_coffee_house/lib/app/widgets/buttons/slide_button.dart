import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlideButton extends StatelessWidget {
  const SlideButton({
    Key? key,
    this.iconButton,
    required this.contentButton,
    this.colorButton,
    this.onPressed,
  }) : super(key: key);

  final IconData? iconButton;
  final String contentButton;
  final Color? colorButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colorButton,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconButton,
              color: theme.backgroundColor,
              size: 20.0,
            ),
            Text(
              contentButton,
              style: theme.textTheme.subtitle2?.copyWith(
                fontSize: 8.0,
                color: theme.colorScheme.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
