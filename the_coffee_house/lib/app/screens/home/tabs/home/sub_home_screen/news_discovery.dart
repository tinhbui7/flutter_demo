import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/home/home_tab_news_cubit.dart';
import 'package:the_coffee_house/app/screens/news/news_detail_screen.dart';

class NewsDiscovery extends StatelessWidget {
  final HomeTabNewsCubit homeTabNewsCubit = HomeTabNewsCubit(0);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List _offer = [
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/App-news--5-.jpg',
        title: 'CUỐI THÁNG VUI TƯƠI - RỘN RÀNG DEAL ĐỈNH',
        blogUrl:
            'https://feed.thecoffeehouse.com/cuoi-thang-vui-tuoi-ron-rang-deal-dinh/',
        date: '26/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/app-news--4-.jpg',
        title: 'ĐỔI BEAN NHANH LẤY ƯU ĐÃI XỊN - VI VU MỜI “NGƯỜI THƯƠNG”',
        blogUrl:
            'https://feed.thecoffeehouse.com/doi-bean-nhanh-lay-uu-dai-xin-vi-vu-moi-nguoi-thuong/',
        date: '18/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/APP-NEWS--3-.jpg',
        title: 'DEAL SIÊU YÊU - CHIỀU BẠN HẾT MỨC',
        blogUrl:
            'https://feed.thecoffeehouse.com/deal-sieu-yeu-chieu-ban-het-muc-2/',
        date: '17/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/AppNews.jpg',
        title: 'RỘN RÀNG GỌI MÓN, NHÀ & MOMO MỜI DEAL XỊN SÒ',
        blogUrl:
            'https://feed.thecoffeehouse.com/ron-rang-goi-mon-nha-momo-moi-deal-xin-so/',
        date: '16/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/AppNews-AllCPG.jpg',
        title: 'GU ĐẬM ĐÀ - DEAL ĐẬM CHẤT CHO NGÀY MỚI NĂNG LƯỢNG',
        blogUrl:
            'https://feed.thecoffeehouse.com/gu-dam-da-deal-dam-chat-cho-ngay-moi-nang-luong/',
        date: '15/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/TCH_800x450-2.png',
        title: 'MÓN NGON SẴN SÀNG, THANH TOÁN TIẾT KIỆM CÙNG ZALOPAY',
        blogUrl:
            'https://feed.thecoffeehouse.com/mon-ngon-san-sang-thanh-toan-tiet-kiem-cung-zalopay-2/',
        date: '14/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/BANNER-WEB.jpg',
        title: 'VUI CÓ BẠN - TƯƠI TRẺ CÓ ĐÔI',
        blogUrl: 'https://feed.thecoffeehouse.com/vui-co-ban-tuoi-tre-co-doi/',
        date: '12/10',
      ),
    ];
    List _update = [
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/Thumbnail_News_now--1-.jpg',
        title: 'THE COFFEE HOUSE RA MẮT MÔ HÌNH CỬA HÀNG TIỆN LỢI MỚI',
        blogUrl:
            'https://feed.thecoffeehouse.com/the-coffee-house-ra-mat-mo-hinh-cua-hang-tien-loi-moi/',
        date: '29/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/News--1--1.jpg',
        title: 'SÀI GÒN ƠI, THE COFFEE HOUSE MỞ LẠI PHỤC VỤ TẠI CHỖ',
        blogUrl:
            'https://feed.thecoffeehouse.com/sai-gon-oi-the-coffee-house-mo-lai-phuc-vu-tai-cho/',
        date: '28/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/Bottle_2310_news-1.jpg',
        title: 'CHAI FRESH LUÔN BÊN BẠN TRONG MỌI KHOẢNH KHẮC',
        blogUrl:
            'https://feed.thecoffeehouse.com/chai-fresh-luon-ben-ban-trong-moi-khoanh-khac/',
        date: '24/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/Thumbnail_2010.png',
        title: 'CHAI FRESH: THAY LỜI YÊU DÀNH TẶNG NGƯỜI PHỤ NỮ ĐẶC BIỆT',
        blogUrl:
            'https://feed.thecoffeehouse.com/chai-fresh-thay-loi-yeu-danh-tang-nguoi-phu-nu-dac-biet/',
        date: '20/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/thumb-1.jpg',
        title: 'CÓ HẸN VỚI CHAI FRESH VÀO NGÀY MAI',
        blogUrl:
            'https://feed.thecoffeehouse.com/co-hen-voi-chai-fresh-vao-ngay-mai/',
        date: '17/10',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/10/Thumbnail_ComeBack-1.png',
        title:
            'SIÊU PHẨM CHAI FRESH SẮP TRỞ LẠI – HỨA HẸN NHIỀU BẤT NGỜ CHO FAN SÀI THÀNH',
        blogUrl:
            'https://feed.thecoffeehouse.com/sieu-pham-chai-fresh-sap-tro-lai-hua-hen-nhieu-bat-ngo-cho-fan-sai-thanh/',
        date: '17/10',
      ),
    ];
    List _coffee = [
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/08/img_8089_grande-1.jpg',
        title: 'Nghệ thuật pha chế -V60',
        blogUrl: 'https://feed.thecoffeehouse.com/nghe-thuat-pha-che-v60/',
        date: '29/08',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/08/img_8189_grande-1.jpg',
        title: 'Nghệ thuật pha chế - Kalita Wave',
        blogUrl:
            'https://feed.thecoffeehouse.com/nghe-thuat-pha-che-kalita-wave/',
        date: '28/08',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/08/img_8668_grande.jpg',
        title: 'Nghệ thuật pha chế - Cold Brew',
        blogUrl:
            'https://feed.thecoffeehouse.com/nghe-thuat-pha-che-cold-brew/',
        date: '27/08',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/08/img_8430_grande-1.jpg',
        title: 'Nghệ thuật pha chế - Espresso',
        blogUrl: 'https://feed.thecoffeehouse.com/espresso/',
        date: '26/08',
      ),
      NewsInfo(
        imageUrl:
            'https://feed.thecoffeehouse.com//content/images/2021/08/img_8586_grande.jpg',
        title: 'Nghệ thuật pha chế - Cappuccino',
        blogUrl:
            'https://feed.thecoffeehouse.com/nghe-thuat-pha-che-cappucino/',
        date: '25/08',
      ),
    ];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: BlocBuilder<HomeTabNewsCubit, int>(
        bloc: homeTabNewsCubit,
        builder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Khám phá thêm',
              style: theme.textTheme.subtitle2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (index == 0)
                      ? _buildItemNews(
                          context,
                          'Ưu đãi đặc biệt',
                          0,
                          theme.splashColor,
                          theme.colorScheme.primary,
                        )
                      : _buildItemNews(
                          context,
                          'Ưu đãi đặc biệt',
                          0,
                          theme.colorScheme.background,
                          theme.colorScheme.onBackground,
                        ),
                  (index == 1)
                      ? _buildItemNews(
                          context,
                          'Cập nhật từ Nhà',
                          1,
                          theme.splashColor,
                          theme.colorScheme.primary,
                        )
                      : _buildItemNews(
                          context,
                          'Cập nhật từ Nhà',
                          1,
                          theme.colorScheme.background,
                          theme.colorScheme.onBackground,
                        ),
                  (index == 2)
                      ? _buildItemNews(
                          context,
                          'CoffeeLover',
                          2,
                          theme.splashColor,
                          theme.colorScheme.primary,
                        )
                      : _buildItemNews(
                          context,
                          'CoffeeLover',
                          2,
                          theme.colorScheme.background,
                          theme.colorScheme.onBackground,
                        ),
                ],
              ),
            ),
            Wrap(
              clipBehavior: Clip.antiAlias,
              spacing: MediaQuery.of(context).size.width * .04,
              children: [
                if (index == 0)
                  ..._offer.map(
                      (e) => _buildNewDetail(context, e, 'Ưu đãi đặc biệt')),
                if (index == 1)
                  ..._update.map(
                      (e) => _buildNewDetail(context, e, 'Cập nhật từ Nhà')),
                if (index == 2)
                  ..._coffee
                      .map((e) => _buildNewDetail(context, e, 'CoffeeLover')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemNews(BuildContext context, String content, int index,
      Color colorBG, Color colorText) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () => homeTabNewsCubit.pageChange(index),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colorBG,
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Text(content,
            style: theme.textTheme.subtitle2?.copyWith(
              fontSize: 14.0,
              color: colorText,
            )),
      ),
    );
  }

  Widget _buildNewDetail(BuildContext context, NewsInfo item, String header) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsDetailScreen(
            blogUrl: item.blogUrl,
            header: header,
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .44,
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.width * .44,
                imageUrl: item.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Image.asset(Assets.picturePlaceHolder),
                errorWidget: (context, url, error) =>
                    Image.asset(Assets.picturePlaceHolder),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                item.title,
                style: theme.textTheme.subtitle2?.copyWith(fontSize: 14.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 20.0,
                  ),
                  Padding(padding: const EdgeInsets.only(left: 10.0)),
                  Text(
                    item.date,
                    style: theme.primaryTextTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsInfo {
  final String imageUrl;
  final String title;
  final String blogUrl;
  final String date;
  NewsInfo({
    required this.imageUrl,
    required this.title,
    required this.blogUrl,
    required this.date,
  });
}
