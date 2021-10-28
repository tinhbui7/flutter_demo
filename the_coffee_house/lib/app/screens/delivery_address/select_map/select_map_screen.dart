import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/routing/app_route.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_bloc.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectMapScreen extends StatefulWidget {
  const SelectMapScreen({Key? key}) : super(key: key);

  @override
  _SelectMapScreenState createState() => _SelectMapScreenState();
}

class _SelectMapScreenState
    extends BaseLayoutState<SelectMapScreen, SelectMapBloc, SelectMapState> {
  _SelectMapScreenState() {
    bloc = SelectMapBloc();
    bloc?.getUserLocation();
    bloc?.fetchData();
  }

  SelectMapBloc get mapBloc => BlocProvider.of<SelectMapBloc>(context);
  List<Placemark>? get placeMarks => state?.placeMarks ?? [];
  final random = Random();

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      LocaleKeys.title_chooseAddress.tr(),
      style: theme.textTheme.subtitle2?.copyWith(fontSize: 17.0),
    );
  }

  @override
  List<Widget> buildHeaderActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 13),
        child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      )
    ];
  }

  @override
  Widget buildContent(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GoogleMap(
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onCameraMove: bloc?.onCameraMove,
          initialCameraPosition: CameraPosition(
            target: bloc!.initialPos,
            zoom: 18.0,
          ),
          onMapCreated: bloc?.onCreated,
          onCameraIdle: () async {
            bloc?.getMoveCamera();
          },
        ),
        Positioned(
          bottom: 0,
          child: Container(
            color: theme.colorScheme.background,
            height: MediaQuery.of(context).size.height * .29,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: placeMarks?.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    _buildAddress(
                      context,
                      placeMarks?[index],
                    ),
                    if (placeMarks?.last != placeMarks?[index]) ...[
                      Divider(
                        indent: MediaQuery.of(context).size.width * .15,
                        height: 0,
                        thickness: 1.0,
                      ),
                    ]
                  ],
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .3,
          right: MediaQuery.of(context).size.width * .035,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .1,
            height: MediaQuery.of(context).size.width * .1,
            child: FloatingActionButton(
              onPressed: bloc?.getUserLocation,
              backgroundColor: theme.colorScheme.background,
              elevation: 2.0,
              shape: const RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(7.0),
                ),
              ),
              child: Icon(
                Icons.near_me,
                color: theme.unselectedWidgetColor,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            Assets.markerIcon,
            height: 75.0,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildAddress(BuildContext context, Placemark? itemMark) {
    String address = '${itemMark?.street}, ${itemMark?.subAdministrativeArea}, '
        '${itemMark?.administrativeArea}, ${itemMark?.country}';

    return InkWell(
      onTap: () {
        cartBloc?.addAddress(address, itemMark?.street);
        Navigator.popUntil(
          context,
          ModalRoute.withName(RouteNames.HOME),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * .11,
        padding: const EdgeInsets.fromLTRB(0, 12.0, 5.0, 12.0),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .15,
              child: Icon(
                Icons.location_on,
                color: theme.unselectedWidgetColor,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${itemMark?.street}',
                    style: theme.textTheme.bodyText2
                        ?.copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$address',
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${random.nextInt(10) + random.nextInt(100) / 100.0} km',
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
