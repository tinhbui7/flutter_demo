import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class SettingScreenState extends BaseBlocState {
  const SettingScreenState({
    this.isLoading = false,
  });

  final bool isLoading;

  @override
  List<Object> get props {
    return [
      isLoading,
    ];
  }

  SettingScreenState copyWith({
    bool? isLoading,
  }) {
    return SettingScreenState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
