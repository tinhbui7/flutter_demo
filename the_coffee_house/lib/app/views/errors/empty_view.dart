import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:easy_localization/easy_localization.dart';

class EmptyView extends StatelessWidget {
  final String? title;
  final String? message;
  final double? height;
  final AlignmentGeometry? alignmentMessage;

  const EmptyView({
    Key? key,
    this.title,
    this.message,
    this.height,
    this.alignmentMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Image(
                  image: AssetImage(Assets.emptyContentIcon),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Align(
              heightFactor: 1.5,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  title ?? 'ABC',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (message?.isNotEmpty == true)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: Align(
                  alignment: alignmentMessage ?? Alignment.center,
                  child: Text(
                    message ?? '',
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
