import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class StoreDetailState extends BaseBlocState {
  const StoreDetailState({
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  List<Object> get props {
    return [
      isLoading,
    ];
  }

  StoreDetailState copyWith({
    bool? isLoading,
  }) {
    return StoreDetailState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
