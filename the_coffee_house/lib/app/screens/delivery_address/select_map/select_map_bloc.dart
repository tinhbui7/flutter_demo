import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_events.dart';

import 'select_map_state.dart';

class SelectMapBloc extends BaseBloc<SelectMapState> {
  @override
  String get tag => 'SelectMapBloc';

  SelectMapBloc() : super(SelectMapState()) {
    on<ChangeListLocationEvent>(_changeListLocation);
  }

   LatLng _initialPosition = LatLng(
    10.778412107359799,
    106.67931869488008,
  );
  LatLng get initialPos => _initialPosition;
  GoogleMapController? _mapController;

  Stream<SelectMapState> _changeListLocation(
    ChangeListLocationEvent event,
    Emitter<SelectMapState> emit,
  ) async* {
    final placeMarks = await placemarkFromCoordinates(
      _initialPosition.latitude,
      _initialPosition.longitude,
    );
    emit(
      SelectMapState(
        placeMarks: placeMarks,
      ),
    );
  }

  void onCameraMove(CameraPosition position) async {
    _initialPosition = position.target;
  }

  void onCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void getUserLocation() async {
    final isLocationServiceEnable = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnable) {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _initialPosition = LatLng(
        position.latitude,
        position.longitude,
      );
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(
          _initialPosition,
        ),
      );
    }
  }
}
