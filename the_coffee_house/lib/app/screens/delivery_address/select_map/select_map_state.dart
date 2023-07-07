import 'package:geocoding/geocoding.dart';
import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class SelectMapState extends BaseBlocState {
  const SelectMapState({
    this.placeMarks = const <Placemark>[],
  });

  final List<Placemark> placeMarks;

  @override
  List<Object> get props {
    return [
      placeMarks,
    ];
  }

  SelectMapState copyWith({
    List<Placemark>? placeMarks,
  }) {
    return SelectMapState(
      placeMarks: placeMarks ?? this.placeMarks,
    );
  }
}
