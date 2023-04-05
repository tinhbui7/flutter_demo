import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_coffee_house/app/constants/assets.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_content/home_base_content_layout.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_state.dart';
import 'package:the_coffee_house/app/screens/store_detail/store_detail_screen.dart';
import 'package:the_coffee_house/app/widgets/content/content_empty.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';
import 'package:the_coffee_house/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class StoreTabScreen extends StatefulWidget {
  const StoreTabScreen({Key? key, this.controller}) : super(key: key);

  final ScrollController? controller;

  @override
  _StoreTabScreenState createState() => _StoreTabScreenState(controller);
}

class _StoreTabScreenState extends HomeBaseContentLayoutState<StoreTabScreen,
    StoreTabBloc, StoreTabState> {
  _StoreTabScreenState(this.controller);

  StoreTabBloc? get bloc => storeBloc;

  ScrollController? controller;
  List<StoreEntity>? get stores => state?.stores ?? [];
  bool? get isMapStore => state?.isMapStore ?? false;
  final random = Random();

  @override
  AppBar? buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: theme.colorScheme.background,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: TextField(
        maxLines: 1,
        style: theme.textTheme.bodyText2?.copyWith(
          fontSize: 17.0,
          color: theme.unselectedWidgetColor,
        ),
        decoration: InputDecoration(
          hintText: LocaleKeys.text_streetName.tr(),
          prefixIcon: Icon(
            Icons.search,
            color: theme.unselectedWidgetColor,
          ),
          contentPadding: const EdgeInsets.all(5.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          fillColor: theme.disabledColor,
          filled: true,
        ),
      ),
      actions: [
        InkWell(
          onTap: () => bloc?.changeMapStore(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (isMapStore == false) ...[
                Icon(
                  Icons.map_outlined,
                  color: theme.colorScheme.onBackground,
                  size: 17.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    LocaleKeys.button_btnMap.tr(),
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ] else ...[
                Icon(
                  Icons.format_list_bulleted,
                  color: theme.colorScheme.onBackground,
                  size: 17.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    LocaleKeys.button_btnStoreList.tr(),
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget buildContent(BuildContext context) {
    return isMapStore == false
        ? (stores?.isNotEmpty == true
            ? Container(
                color: theme.splashColor,
                child: SingleChildScrollView(
                  controller: controller,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 15.0),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.text_otherStores.tr(),
                        style:
                            theme.textTheme.subtitle2?.copyWith(fontSize: 18.0),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 10.0)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: stores?.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (controller == null) {
                                _showStoreDetailPopup(context, stores![index]);
                              } else {
                                cartBloc?.addStoreAddress(stores?[index]);
                                Navigator.popUntil(
                                  context,
                                  ModalRoute.withName('/Home'),
                                );
                              }
                            },
                            child: _buildItemStore(
                              context,
                              stores![index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            : ContentEmpty())
        : GoogleMap(
            mapToolbarEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(10.778412107359799, 106.67931869488008),
              zoom: 14,
            ),
            markers: {...stores!.map((e) => _marker(e))},
          );
  }

  Marker _marker(StoreEntity item) => Marker(
        onTap: () {
          if (controller == null) {
            _showStoreDetailPopup(context, item);
          } else {
            cartBloc?.addStoreAddress(item);
            Navigator.popUntil(
              context,
              ModalRoute.withName('/Home'),
            );
          }
        },
        markerId: MarkerId('${item.name}'),
        position: LatLng(
          item.location?.latitude ?? 0,
          item.location?.longitude ?? 0,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      );

  Widget _buildItemStore(BuildContext context, StoreEntity store) {
    return Card(
      elevation: 0.3,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(9.0),
        ),
      ),
      color: theme.colorScheme.background,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: MediaQuery.of(context).size.height * .125,
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: CachedNetworkImage(
                imageUrl: store.image!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.height * .092,
                height: double.infinity,
                placeholder: (context, url) =>
                    Image.asset(Assets.picturePlaceHolder),
                errorWidget: (context, url, error) =>
                    Image.asset(Assets.picturePlaceHolder),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'THE COFFEE HOUSE',
                    style: theme.primaryTextTheme.caption?.copyWith(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${store.fullAddress}',
                    style: theme.textTheme.bodyText2?.copyWith(fontSize: 14.0),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    context.locale.languageCode == 'en'
                        ? '${random.nextInt(100) + random.nextInt(100) / 100.0} km ${LocaleKeys.away.tr()}'
                        : '${LocaleKeys.away.tr()} ${random.nextInt(100) + random.nextInt(100) / 100.0} km',
                    style: theme.primaryTextTheme.caption?.copyWith(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _showStoreDetailPopup(BuildContext context, StoreEntity store) {
    var topPadding = 1 -
        (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
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
        minChildSize: 0,
        expand: false,
        builder: (context, controller) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: const Radius.circular(20.0),
            ),
          ),
          child: StoreDetailScreen(
            controller: controller,
            storeEntity: store,
          ),
        ),
      ),
    );
  }
}
