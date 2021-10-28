import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_dialog/base_dialog_state.dart';
import 'package:the_coffee_house/app/screens/store_detail/store_detail_bloc.dart';
import 'package:the_coffee_house/app/screens/store_detail/store_detail_state.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({
    Key? key,
    required this.controller,
    required this.storeEntity,
  }) : super(key: key);

  final ScrollController controller;
  final StoreEntity storeEntity;

  @override
  _StoreDetailScreenState createState() =>
      _StoreDetailScreenState(controller, storeEntity);
}

class _StoreDetailScreenState extends BaseDialogState<StoreDetailScreen,
    StoreDetailBloc, StoreDetailState> {
  _StoreDetailScreenState(this.controller, this.storeEntity) {
    bloc = StoreDetailBloc();
    bloc?.fetchData();
  }

  final ScrollController controller;
  final StoreEntity storeEntity;

  @override
  Widget buildDialogContent(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return true;
      },
      child: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * .43,
            imageUrl: storeEntity.image!,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                Image.asset(Assets.picturePlaceHolder),
            errorWidget: (context, url, error) =>
                Image.asset(Assets.picturePlaceHolder),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'THE COFFEE HOUSE',
                  style: theme.primaryTextTheme.caption?.copyWith(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    '${storeEntity.name}',
                    style: theme.textTheme.subtitle2?.copyWith(fontSize: 18.0),
                  ),
                ),
                Text(
                  '${LocaleKeys.title_openTime.tr()}: ${storeEntity.openTime}',
                  style: theme.primaryTextTheme.caption,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                _showFunctionStore(
                    Icons.near_me_outlined, '${storeEntity.fullAddress}'),
                _showFunctionStore(Icons.favorite_border_rounded,
                    LocaleKeys.title_addFavourite.tr()),
                _showFunctionStore(
                    Icons.ios_share, LocaleKeys.title_shareAddress.tr()),
                _showFunctionStore(Icons.call,
                    '${LocaleKeys.title_contact.tr()}: ${storeEntity.phone}')
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  mapToolbarEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      storeEntity.location?.latitude ?? 0,
                      storeEntity.location?.longitude ?? 0,
                    ),
                    zoom: 16,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('${storeEntity.name}'),
                      position: LatLng(
                        storeEntity.location?.latitude ?? 0,
                        storeEntity.location?.longitude ?? 0,
                      ),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueOrange),
                    ),
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: ElevatedButton(
              onPressed: () {
                cartBloc?.addStoreAddress(storeEntity);
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  Text(
                    LocaleKeys.button_btnOrderProducts.tr(),
                    style: theme.textTheme.subtitle2?.copyWith(
                      color: theme.colorScheme.background,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    LocaleKeys.text_textPickup.tr(),
                    style: theme.textTheme.bodyText2
                        ?.copyWith(color: theme.colorScheme.background),
                  )
                ],
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                primary: theme.colorScheme.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showFunctionStore(IconData icon, String contentFunction) {
    return InkWell(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: theme.splashColor,
              borderRadius: BorderRadius.all(
                Radius.circular(9.0),
              ),
            ),
            child: Icon(
              icon,
              size: 15.0,
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 15.0)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .09,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        contentFunction,
                        style:
                            theme.textTheme.bodyText2?.copyWith(fontSize: 14.0),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  height: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
