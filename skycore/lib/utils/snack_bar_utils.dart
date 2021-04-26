import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skycore/styles/themes/snack_bar_theme.dart';

class SnackBarUtils {
  static SnackBar buildSnackBar(
    BuildContext context,
    String content, {
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme.build(context);

    return SnackBar(
      backgroundColor: theme.colorScheme.background,
      content: Container(
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Text(
          content,
          style: theme.textTheme.caption,
        ),
      ),
      elevation: 3.0,
      duration: duration,
    );
  }

  static SnackBar buildSnackBarWithRightButton(
    BuildContext context,
    String content,
    String textButton,
    VoidCallback onButtonPressed, {
    TextStyle? btnTextStyle,
    Duration duration = const Duration(seconds: 10),
  }) {
    ThemeData theme = SnackBarTheme.build(context);
    return SnackBar(
      backgroundColor: theme.colorScheme.background,
      content: Container(
        child: Text(
          content,
          style: theme.textTheme.caption,
        ),
      ),
      action: SnackBarAction(
        onPressed: onButtonPressed,
        label: textButton.toUpperCase(),
        textColor: theme.accentColor,
      ),
      elevation: 3.0,
      duration: duration,
    );
  }

  static SnackBar buildInfoSnackBar(
    BuildContext context,
    String content, {
    IconData? icon,
    bool showIcon = false,
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme.build(context);

    return SnackBar(
      backgroundColor: theme.colorScheme.background,
      content: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            showIcon
                ? Padding(
                    child: Icon(
                      icon ?? Icons.info,
                      size: 20,
                      color: Theme.of(context).accentColor,
                    ),
                    padding: const EdgeInsets.only(right: 10.0, top: 2.0),
                  )
                : Container(height: 0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  content,
                  style: theme.textTheme.caption,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 3.0,
      duration: duration,
    );
  }

  static SnackBar buildErrorSnackBar(
    BuildContext context,
    String content, {
    Duration duration = const Duration(seconds: 5),
  }) {
    ThemeData theme = SnackBarTheme.build(context);

    return SnackBar(
      backgroundColor: theme.colorScheme.background,
      content: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              child: Icon(
                Icons.error_outline,
                size: 20,
                color: theme.errorColor,
              ),
              padding: const EdgeInsets.only(right: 10.0, top: 1.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 3.0),
                child: Text(
                  content,
                  style: theme.textTheme.caption,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 3.0,
      duration: duration,
    );
  }
}
