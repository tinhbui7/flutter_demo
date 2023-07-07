import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/screens/cart_detail/cart_screen.dart';
import 'package:the_coffee_house/app/widgets/icons/custom_icon.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

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
                  endActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 15.0,
                        ),
                        child: InkWell(
                          onTap: () => cartBloc.add(DeleteAllBillEvent()),
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
                                LocaleKeys.button_btnDelete.tr(),
                                style: TextStyle(
                                    color: theme.backgroundColor,
                                    fontSize: 9.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: () => _showCartDetail(context),
                    child: Card(
                      elevation: 3,
                      shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(9.0),
                        ),
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
                          title: Row(
                            children: [
                              Text(
                                '${LocaleKeys.title_currentCart.tr()} ',
                                style:
                                    theme.primaryTextTheme.subtitle2?.copyWith(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 16.0,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            '${NumberFormat.currency(
                              locale: 'vi',
                              symbol: 'đ',
                            ).format(cartBloc.totalPayment)} \u00b7 ${cartBloc.productOrders}',
                            style: theme.primaryTextTheme.caption?.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
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

  Future _showCartDetail(BuildContext context) {
    var topPadding = 1 -
        (MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
                .padding
                .top /
            MediaQuery.of(context).size.height);
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.vertical(
          top: const Radius.circular(20.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: topPadding,
        maxChildSize: topPadding,
        minChildSize: 0.0,
        expand: false,
        builder: (context, scrollController) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: const Radius.circular(20.0),
            ),
          ),
          child: CartScreen(
            scrollControl: scrollController,
          ),
        ),
      ),
    );
  }
}
