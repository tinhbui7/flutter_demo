import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return (state.orderEntities?.isNotEmpty == true)
            ? Positioned(
                right: 10,
                left: 10,
                bottom: 15,
                child: Slidable(
                  actionPane: SlidableBehindActionPane(),
                  closeOnScroll: true,
                  secondaryActions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15.0,
                      ),
                      child: SlideAction(
                        child: InkWell(
                          onTap: () => cartBloc.deleteAllBill(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete_forever,
                                color: theme.backgroundColor,
                                size: 23.0,
                              ),
                              Text(
                                'XOÁ',
                                style: TextStyle(
                                    color: theme.backgroundColor,
                                    fontSize: 9.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    color: Color(0xFFFFF7E6),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .09,
                      padding: const EdgeInsets.only(top: 3.0),
                      child: ListTile(
                        leading: CustomIcon(
                          9,
                          Color(0xFFFFE7BA),
                          Icons.card_travel_outlined,
                          theme.primaryColor,
                        ),
                        title: Text(
                          'Giỏ hàng hiện tại ->',
                          style: theme.primaryTextTheme.caption?.copyWith(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${NumberFormat.currency(
                            locale: 'vi',
                            symbol: 'đ',
                          ).format(cartBloc.totalPayment)} . ${cartBloc.productOrders}',
                          style: theme.primaryTextTheme.caption?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
