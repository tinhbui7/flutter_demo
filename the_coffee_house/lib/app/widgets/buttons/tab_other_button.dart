import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabOtherButton extends StatelessWidget {
  const TabOtherButton({
    Key? key,
    required this.iconButton,
    required this.contentButton,
    this.onPressed,
    this.isButton = true,
  }) : super(key: key);

  final String contentButton;
  final IconData iconButton;
  final VoidCallback? onPressed;
  final bool? isButton;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 10.0),
              child: Icon(
                iconButton,
                size: 19.0,
                color: theme.colorScheme.onBackground,
              ),
            ),
            Expanded(child: Text(contentButton)),
            if (isButton == true) ...[
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 17.0,
                color: theme.colorScheme.onBackground,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7.0),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
