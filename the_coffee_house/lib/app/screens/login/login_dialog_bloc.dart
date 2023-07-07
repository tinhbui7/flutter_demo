import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/login/login_dialog_events.dart';

import 'login_dialog_state.dart';

class LoginDialogBloc extends BaseBloc<LoginDialogState> {
  @override
  String get tag => 'LoginDialogBloc';

  LoginDialogBloc() : super(LoginDialogState()) {
    on<CheckPhoneNumberEvent>(_checkPhoneNumber);
  }

  void _checkPhoneNumber(
    CheckPhoneNumberEvent event,
    Emitter<LoginDialogState> emit,
  ) {
    var isCheckInput = false;

    if (event.phoneNumber.length == 10 &&
        int.tryParse(event.phoneNumber) != null) {
      isCheckInput = true;
    }

    emit(state.copyWith(isCheckInput: isCheckInput));
  }
}
