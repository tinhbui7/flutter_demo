import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class OrderTabState extends BaseBlocState {
  OrderTabState({
    OrderTabState? state,
    bool? isLoading,
  }) : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
