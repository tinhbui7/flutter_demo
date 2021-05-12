import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class HomeScreenState extends BaseBlocState {
  final String? message;
  HomeScreenState({
    HomeScreenState? state,
    String? message,
    bool? isLoading,
  })  : message = message ?? state?.message,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
