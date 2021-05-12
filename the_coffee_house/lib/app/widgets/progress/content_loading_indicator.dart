import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/styles/colors.dart';

class ContentLoadingIndicator extends StatelessWidget {
  final double strokeWidth;
  final Color fgColor;

  ContentLoadingIndicator({this.fgColor = kColorPrimary, this.strokeWidth = 3});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 3.0,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      valueColor: AlwaysStoppedAnimation(fgColor),
    );
  }
}
