import 'package:geocoding/geocoding.dart';
import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class SelectMapState extends BaseBlocState {
  final List<Placemark>? placeMarks;
  SelectMapState({
    SelectMapState? state,
    bool? isLoading,
    List<Placemark>? placeMarks,
  })  : placeMarks = placeMarks ?? state?.placeMarks,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
