import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_screen.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';

void showPopupSelectOrder(context) {
  CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
  ThemeData theme = Theme.of(context);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: const BorderRadius.vertical(
        top: const Radius.circular(10.0),
      ),
    ),
    builder: (context) {
      return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => Container(
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: const Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    heightFactor: 2.7,
                    child: Text(
                      LocaleKeys.title_chooseOrderMethod.tr(),
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.clear_rounded,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.0,
                height: 0,
              ),
              Container(
                color: (state.activeOrder == OrderTab.Delivery)
                    ? Color(0xFFFFF7E6)
                    : theme.colorScheme.background,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  horizontalTitleGap: 7,
                  onTap: () {
                    if (state.deliveryEntity == null) {
                      Navigator.of(context).pushNamed(RouteNames.DELIVERY);
                    }
                    if (state.deliveryEntity != null &&
                        state.activeOrder != OrderTab.Delivery) {
                      cartBloc.changeOrderMethod(OrderTab.Delivery);
                      Navigator.pop(context);
                    }
                  },
                  leading: Image.asset(
                    Assets.deliveryIcon,
                    fit: BoxFit.cover,
                    width: 35.0,
                  ),
                  title: Text(
                    LocaleKeys.button_btnDelivery.tr(),
                    style: (state.activeOrder == OrderTab.Delivery)
                        ? theme.textTheme.bodyText2
                            ?.copyWith(color: Colors.black)
                        : theme.textTheme.bodyText2,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.deliveryEntity?.address ?? LocaleKeys.text_deliveryContent.tr()}',
                        style: (state.activeOrder == OrderTab.Delivery)
                            ? theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5, color: Colors.black)
                            : theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                      /*Text(
                        'Sun Life 19001001',
                        style: (state.activeOrder == OrderTab.Delivery)
                            ? theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5, color: Colors.black)
                            : theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5),
                      ),*/
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteNames.DELIVERY);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: theme.colorScheme.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      LocaleKeys.button_btnEdit.tr(),
                      style: theme.textTheme.bodyText1?.copyWith(
                        fontSize: 13.0,
                        color: theme.colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: (state.activeOrder == OrderTab.Pickup)
                    ? Color(0xFFFFF7E6)
                    : theme.colorScheme.background,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  horizontalTitleGap: 7,
                  onTap: () {
                    if (state.storeEntity == null) {
                      _showStoreDetailPopup(context);
                    }
                    if (state.storeEntity != null &&
                        state.activeOrder != OrderTab.Pickup) {
                      cartBloc.changeOrderMethod(OrderTab.Pickup);
                      Navigator.pop(context);
                    }
                  },
                  leading: Image.asset(
                    Assets.pickupIcon,
                    fit: BoxFit.cover,
                    width: 35.0,
                  ),
                  title: Text(
                    LocaleKeys.button_btnPickup.tr(),
                    style: (state.activeOrder == OrderTab.Pickup)
                        ? theme.textTheme.bodyText2
                            ?.copyWith(color: Colors.black)
                        : theme.textTheme.bodyText2,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${state.storeEntity?.name ?? LocaleKeys.text_pickupContent.tr()}',
                        style: (state.activeOrder == OrderTab.Pickup)
                            ? theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5, color: Colors.black)
                            : theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '0.00 km',
                        style: (state.activeOrder == OrderTab.Pickup)
                            ? theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5, color: Colors.black)
                            : theme.textTheme.bodyText2
                                ?.copyWith(fontSize: 13.5),
                      ),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () => _showStoreDetailPopup(context),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: theme.colorScheme.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20.0),
                        ),
                      ),
                    ),
                    child: Text(
                      LocaleKeys.button_btnEdit.tr(),
                      style: theme.textTheme.bodyText1?.copyWith(
                        fontSize: 13.0,
                        color: theme.colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future _showStoreDetailPopup(BuildContext context) {
  var topPadding = 1 -
      (MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top /
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
      minChildSize: 0,
      expand: false,
      builder: (context, controller) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: const Radius.circular(20.0),
          ),
        ),
        child: StoreTabScreen(
          controller: controller,
        ),
      ),
    ),
  );
}
