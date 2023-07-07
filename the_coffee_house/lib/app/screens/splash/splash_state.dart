import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class SplashScreenState extends BaseBlocState {
  const SplashScreenState({
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  List<Object> get props {
    return [
      isLoading,
    ];
  }

  SplashScreenState copyWith({
    bool? isLoading,
  }) {
    return SplashScreenState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  // SplashScreenState({
  //   SplashScreenState? state,
  //   bool? isLoading,
  // }) : super(
  //         isLoading: isLoading ?? state?.isLoading,
  //         timeStamp: DateTime.now().microsecondsSinceEpoch,
  //       );
}
