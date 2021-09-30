import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:page_indicator/page_indicator.dart';

class HomeSlider extends StatelessWidget {
  final _itemImage = [
    InkWell(
      child: Image.asset(
        Assets.sliderNo1,
        fit: BoxFit.cover,
      ),
      onTap: () {},
    ),
    InkWell(
      child: Image.asset(
        Assets.sliderNo2,
        fit: BoxFit.cover,
      ),
      onTap: () {},
    ),
    InkWell(
      child: Image.asset(
        Assets.sliderNo3,
        fit: BoxFit.cover,
      ),
      onTap: () {},
    ),
    InkWell(
      child: Image.asset(
        Assets.sliderNo4,
        fit: BoxFit.cover,
      ),
      onTap: () {},
    ),
    InkWell(
      child: Image.asset(
        Assets.sliderNo5,
        fit: BoxFit.cover,
      ),
      onTap: () {},
    )
  ];

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    _animateSlider();

    return Container(
      height: MediaQuery.of(context).size.height * .3,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        child: _buildPageView(context),
      ),
    );
  }

  Widget _buildPageView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PageIndicatorContainer(
      child: PageView(
        controller: _controller,
        children: _itemImage,
      ),
      indicatorSpace: 2,
      length: _itemImage.length,
      padding: const EdgeInsets.only(bottom: 7),
      shape: IndicatorShape.roundRectangleShape(
        size: Size(18, 2),
      ),
      indicatorColor: theme.highlightColor,
      indicatorSelectorColor: theme.buttonColor,
    );
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 7)).then((_) {
      int nextPage = _controller.page!.round() + 1;

      if (nextPage == _itemImage.length) {
        nextPage = 0;
      }

      _controller
          .animateToPage(nextPage,
              duration: Duration(milliseconds: 300), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }
}
