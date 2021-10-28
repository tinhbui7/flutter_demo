import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowText extends StatelessWidget {
  const ShadowText({
    Key? key,
    required this.data,
    this.style,
    this.color,
  }) : super(key: key);

  final String data;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 0.5,
            left: 0,
            child: Text(
              data,
              style: style?.copyWith(color: color?.withOpacity(0.5)),
            ),
          ),
          Text(data, style: style)
        ],
      ),
    );
  }
}
