import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_events.dart';

import 'select_map_state.dart';

class SelectMapBloc extends BaseBloc<SelectMapState> {
  @override
  String get tag => 'SelectMapBloc';

  SelectMapBloc() : super(SelectMapState(isLoading: true));

  LatLng _initialPosition = LatLng(10.778412107359799, 106.67931869488008);
  LatLng get initialPos => _initialPosition;
  GoogleMapController? _mapController;

  @override
  Stream<SelectMapState> mapEventToState(BaseBlocEvent event) async* {
    if (event is ChangeListLocation) {
      yield* _changeListLocationState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  @protected
  @override
  Stream<SelectMapState> fetchDataState(FetchDataEvent event) async* {
    yield SelectMapState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<SelectMapState> refreshState(RefreshEvent event) async* {
    yield SelectMapState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  Stream<SelectMapState> _changeListLocationState(
      ChangeListLocation event) async* {
    List<Placemark> placeMarks = await placemarkFromCoordinates(
        _initialPosition.latitude, _initialPosition.longitude);
    yield SelectMapState(
      state: state,
      isLoading: false,
      placeMarks: placeMarks,
    );
  }

  void onCameraMove(CameraPosition position) async {
    _initialPosition = position.target;
  }

  void onCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void getMoveCamera() async {
    add(ChangeListLocation());
  }

  void getUserLocation() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _initialPosition = LatLng(position.latitude, position.longitude);
      _mapController?.animateCamera(CameraUpdate.newLatLng(_initialPosition));
    }
  }
}
