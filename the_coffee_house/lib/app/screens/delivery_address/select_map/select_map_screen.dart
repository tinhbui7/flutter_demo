import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/screens/base_layout/base_layout_state.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_bloc.dart';
import 'package:the_coffee_house/app/screens/delivery_address/select_map/select_map_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectMapScreen extends StatefulWidget {
  const SelectMapScreen({Key? key}) : super(key: key);

  @override
  _SelectMapScreenState createState() => _SelectMapScreenState();
}

class _SelectMapScreenState
    extends BaseLayoutState<SelectMapScreen, SelectMapBloc, SelectMapState> {
  _SelectMapScreenState() {
    bloc = SelectMapBloc();
    bloc?.fetchData();
  }

  SelectMapBloc get mapBloc => BlocProvider.of<SelectMapBloc>(context);

  @override
  Widget buildTitle(BuildContext context) {
    return Text('Chọn địa chỉ');
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
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(10.81884162946266, 106.65702164419534),
        zoom: 15.0,
        bearing: 0.0,
        tilt: 0.0,
      ),
    );
  }
}
