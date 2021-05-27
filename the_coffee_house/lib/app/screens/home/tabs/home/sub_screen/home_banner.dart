import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .22,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          child: Image.asset(
            Assets.bannerHome,
            fit: BoxFit.cover,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
