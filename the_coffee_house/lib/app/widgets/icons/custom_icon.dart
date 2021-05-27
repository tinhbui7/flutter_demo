import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomIcon extends StatelessWidget {
  final double sizeIcon;
  final Color colorBox;
  final IconData icon;
  final Color colorIcon;

  CustomIcon(this.sizeIcon, this.colorBox, this.icon, this.colorIcon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(sizeIcon),
      decoration: BoxDecoration(
        color: colorBox,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        icon,
        color: colorIcon,
      ),
    );
  }
}
