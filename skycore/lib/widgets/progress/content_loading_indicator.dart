import 'package:flutter/material.dart';
import 'package:skycore/styles/colors.dart';

class ContentLoadingIndicator extends StatelessWidget {
  final Color fgColor;
  final double strokeWidth;

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
