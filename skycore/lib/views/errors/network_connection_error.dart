import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skycore/constants/assets.dart';

class NetworkConnectionError extends StatelessWidget {
  final VoidCallback onPressed;

  const NetworkConnectionError({Key? key, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 100,
              child: Image(
                image: AssetImage(Assets.emptyContentIcon),
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              heightFactor: 1.5,
              alignment: Alignment.center,
              child: Text(
                'No Content'.toUpperCase(),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "Nothing to show here. Please check your connection and try again.",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
