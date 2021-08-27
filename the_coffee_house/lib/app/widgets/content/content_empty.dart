import 'package:flutter/widgets.dart';

class ContentEmpty extends StatelessWidget {
  const ContentEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Empty...'),
      ),
    );
  }
}
