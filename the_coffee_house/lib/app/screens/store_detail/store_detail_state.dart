import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class StoreDetailState extends BaseBlocState {
  StoreDetailState({
    StoreDetailState? state,
    bool? isLoading,
  }) : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
