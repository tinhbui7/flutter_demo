import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class StoreTabState extends BaseBlocState {
  StoreTabState({
    StoreTabState? state,
    bool? isLoading,
  }) : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
