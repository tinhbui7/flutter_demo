import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_state.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/sub_screen/order_with_search.dart';
import 'package:the_coffee_house/domain/domain.dart';

import '../home_base_content_layout.dart';
import 'sub_screen/app_bar_order.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({Key? key}) : super(key: key);

  @override
  _OrderTabScreenState createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends HomeBaseContentLayoutState<OrderTabScreen,
    OrderTabBloc, OrderTabState> {
  _OrderTabScreenState() {
    bloc = OrderTabBloc();
    bloc?.loadProduct();
    bloc?.loadSection();
  }

  List<SectionEntity> get products => state?.products ?? [];

  List<SectionEntity> get sections => state?.sections ?? [];

  @override
  Widget buildContent(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          AppBarOrder(size: size, theme: theme),
          OrderWithSearch(size: size, theme: theme),
          Divider(
            height: 0,
            thickness: 1,
          ),
          Expanded(
            child: Container(
              color: theme.selectedRowColor,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Text(products[index].name!);
                },
              ),

              /*child: SingleChildScrollView(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thực đơn',
                      style: theme.textTheme.headline6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                    ),
                    Container(
                      height: size.height * .135,
                      width: size.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: theme.backgroundColor,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cà phê sữa',
                                  style: theme.textTheme.subtitle1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Hãy để Cà phê sữa đá Nhà thơm ngon đậm vị đồng hành cùng nhịp sống sôi nổi của tuổi trẻ, cho bạn một ngày làm việc đầy hứng khởi.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text('32000đ'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                          ),
                          Image.network(
                            'https://minio.thecoffeehouse.com/image/menufrontend/5b03966a1acd4d5bbd6723a3_cafe-sua-da.jpg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
            ),
          ),
        ],
      ),
    );
  }
}
