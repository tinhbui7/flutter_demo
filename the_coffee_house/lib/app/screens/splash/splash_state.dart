import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class SplashScreenState extends BaseBlocState {
  SplashScreenState({
    SplashScreenState? state,
    bool? isLoading,
  }) : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().microsecondsSinceEpoch,
        );
}
