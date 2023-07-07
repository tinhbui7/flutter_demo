import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class LoginDialogState extends BaseBlocState {
  const LoginDialogState({
    this.isCheckInput = false,
  });

  final bool isCheckInput;

  @override
  List<Object> get props {
    return [
      isCheckInput,
    ];
  }

  LoginDialogState copyWith({
    bool? isCheckInput,
  }) {
    return LoginDialogState(
      isCheckInput: isCheckInput ?? this.isCheckInput,
    );
  }
}
