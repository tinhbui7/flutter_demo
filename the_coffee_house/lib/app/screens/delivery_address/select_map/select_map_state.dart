import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class SelectMapState extends BaseBlocState {
  SelectMapState({
    SelectMapState? state,
    bool? isLoading,
  }) : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
