import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class HomeTabState extends BaseBlocState {
  final String? message;

  HomeTabState({
    HomeTabState? state,
    bool? isLoading,
    String? message,
  })  : message = message ?? state?.message,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
