import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class HomeTabState extends BaseBlocState {
  const HomeTabState({
    this.message = '',
  });

  final String message;

  @override
  List<Object> get props {
    return [
      message,
    ];
  }

  HomeTabState copyWith({
    String? message,
  }) {
    return HomeTabState(
      message: message ?? this.message,
    );
  }
}
