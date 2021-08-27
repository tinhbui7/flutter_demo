import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    Key? key,
    this.onPressed,
    this.icon,
    required this.contentButton,
    this.color,
    this.borderSide,
  }) : super(key: key);

  final GestureTapCallback? onPressed;
  final IconData? icon;
  final String contentButton;
  final Color? color;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      child: Container(
        constraints: const BoxConstraints(minHeight: 50),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Theme.of(context).iconTheme.color,
                size: 17,
              ),
              Padding(padding: const EdgeInsets.only(right: 9)),
            ],
            Text(
              contentButton,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        side: borderSide,
      ),
    );
  }
}
