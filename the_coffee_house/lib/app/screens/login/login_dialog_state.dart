import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class LoginDialogState extends BaseBlocState {
  final bool? isCheckInput;
  LoginDialogState({
    LoginDialogState? state,
    bool? isLoading,
    bool? isCheckInput,
  })  : isCheckInput = isCheckInput ?? state?.isCheckInput,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
