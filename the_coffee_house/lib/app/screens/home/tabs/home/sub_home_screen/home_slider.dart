import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_cubit.dart';

class HomeSlider extends StatelessWidget {
  final HomeTabCubit homeTabCubit = HomeTabCubit(0);

  final _urlImage = [
    'https://minio.thecoffeehouse.com/image/admin/banner-web-KETNOI-1200X480(1)_280533.jpg',
    'https://minio.thecoffeehouse.com/image/admin/bannerhomeWEB-Caphetainha_409405.jpg',
    'https://minio.thecoffeehouse.com/image/admin/WEB-bannehome-TUNGTANG_778598.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: _urlImage.length,
            itemBuilder: (context, index, realIndex) =>
                _buildImage(context, _urlImage[index]),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .21,
              autoPlay: true,
              viewportFraction: 1.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 7),
              onPageChanged: (index, reason) => homeTabCubit.pageChange(index),
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 12)),
          _buildIndicator(context),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context, String item) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: item,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                Image.asset(Assets.picturePlaceHolder),
          ),
        ),
      );

  Widget _buildIndicator(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<HomeTabCubit, int>(
      bloc: homeTabCubit,
      builder: (context, index) => AnimatedSmoothIndicator(
        activeIndex: index,
        count: _urlImage.length,
        effect: SlideEffect(
          dotWidth: 18,
          dotHeight: 2,
          spacing: 3,
          dotColor: theme.disabledColor,
          activeDotColor: theme.colorScheme.onBackground,
        ),
      ),
    );
  }
}
