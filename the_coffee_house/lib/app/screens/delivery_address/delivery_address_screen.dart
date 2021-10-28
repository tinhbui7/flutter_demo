import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/delivery_address/delivery_address_bloc.dart';
import 'package:the_coffee_house/app/screens/delivery_address/delivery_address_state.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  _DeliveryAddressScreenState createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends BaseLayoutState<DeliveryAddressScreen,
    DeliveryAddressBloc, DeliveryAddressState> {
  _DeliveryAddressScreenState() {
    bloc = DeliveryAddressBloc();
    bloc?.fetchData();
  }

  @override
  Widget buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * .035),
      child: TextField(
        maxLines: 1,
        style: theme.textTheme.bodyText2?.copyWith(
          fontSize: 17.0,
          color: theme.unselectedWidgetColor,
        ),
        decoration: InputDecoration(
          hintText: LocaleKeys.text_search.tr(),
          prefixIcon: Icon(
            Icons.search,
            color: theme.unselectedWidgetColor,
          ),
          contentPadding: const EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          fillColor: theme.disabledColor,
          filled: true,
        ),
      ),
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return Container(
      color: theme.splashColor,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 15)),
          Container(
            height: MediaQuery.of(context).size.height * .065,
            color: theme.backgroundColor,
            child: ListTile(
              leading: Icon(
                Icons.map,
                color: theme.colorScheme.onBackground,
              ),
              title: Text(
                LocaleKeys.title_selectMap.tr(),
                style: theme.textTheme.bodyText1,
              ),
              trailing: Icon(
                Icons.navigate_next,
                size: 35,
                color: theme.colorScheme.onBackground,
              ),
              minLeadingWidth: 10,
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.MAP);
              },
            ),
          ),
        ],
      ),
    );
  }
}
