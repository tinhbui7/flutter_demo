import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_bloc.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/app/styled_widgets/separator_line.dart';
import 'package:the_coffee_house/app/widgets/buttons/dynamic_button.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderMethod extends StatelessWidget {
  const OrderMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    return Container(
      color: theme.colorScheme.background,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return (state.orderType == OrderType.DELIVERY)
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 17.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.button_btnDelivery.tr(),
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 17.0, fontWeight: FontWeight.w500),
                          ),
                          DynamicButton(
                            contentButton: LocaleKeys.button_btnChange.tr(),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 0),
                        title: Text(
                          '${state.deliveryEntity.street}',
                          style: theme.textTheme.titleSmall
                              ?.copyWith(fontSize: 15.0),
                        ),
                        subtitle: Text(
                          '${state.deliveryEntity.address}',
                          style: theme.primaryTextTheme.bodySmall
                              ?.copyWith(fontSize: 12.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
                      child: TextField(
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.0,
                        ),
                        decoration: InputDecoration(
                          hintText:
                              LocaleKeys.text_moreShippingInstructions.tr(),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .06,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tính Bùi'),
                                  Text(
                                    '0123456789',
                                    style: theme.primaryTextTheme.caption,
                                  ),
                                  SeparatorLine(
                                      color: theme.unselectedWidgetColor),
                                ],
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1.0,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Ngày mai'),
                                  Text(
                                    'Sớm nhất có thể',
                                    style: theme.primaryTextTheme.caption,
                                  ),
                                  SeparatorLine(
                                      color: theme.unselectedWidgetColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SwitchListTile(
                      title: Text(
                        LocaleKeys.button_btnSaveShipping.tr(),
                        style:
                            theme.textTheme.bodyMedium?.copyWith(fontSize: 13.0),
                      ),
                      value: state.isSaveAddress ?? false,
                      onChanged: (bool value) =>
                          cartBloc.add(ChangeSaveAddressEvent(value)),
                      activeColor: theme.colorScheme.primary,
                      activeTrackColor: Color(0xFFF8DCBE),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 17.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.button_btnPickup.tr(),
                            style: theme.textTheme.titleSmall?.copyWith(
                                fontSize: 17.0, fontWeight: FontWeight.w500),
                          ),
                          DynamicButton(
                            contentButton: LocaleKeys.button_btnChange.tr(),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 13.0),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 0),
                        title: Text(
                          '${state.storeEntity.name}',
                          style: theme.textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          '${state.storeEntity.fullAddress}',
                          style: theme.primaryTextTheme.bodySmall
                              ?.copyWith(fontSize: 12.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 1.0,
                      indent: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 20.0,),
                      child: ListTile(
                        dense: true,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: 0,),
                        title: Text(
                          'Ngày mai',
                          style: theme.textTheme.bodyMedium,
                        ),
                        subtitle: Text(
                          'Sớm nhất có thể',
                          style: theme.primaryTextTheme.bodySmall
                              ?.copyWith(fontSize: 12.0),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.0,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
