import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DynamicButton extends StatelessWidget {
  const DynamicButton({
    Key? key,
    this.onPressed,
    required this.contentButton,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String contentButton;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Color(0xFFFFF7E6),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        contentButton,
        style: theme.textTheme.bodyText1
            ?.copyWith(fontSize: 11.0, color: theme.colorScheme.primary),
      ),
    );
  }
}
