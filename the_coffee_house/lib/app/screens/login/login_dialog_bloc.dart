import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/login/login_dialog_events.dart';

import 'login_dialog_state.dart';

class LoginDialogBloc extends BaseBloc<LoginDialogState> {
  @override
  String get tag => 'LoginDialogBloc';

  LoginDialogBloc()
      : super(LoginDialogState(
          isLoading: false,
          isCheckInput: false,
        ));

  @override
  Stream<LoginDialogState> mapEventToState(BaseBlocEvent event) async* {
    if (event is CheckPhoneNumberEvent) {
      yield* _checkPhoneNumberState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<LoginDialogState> _checkPhoneNumberState(
    CheckPhoneNumberEvent event,
  ) async* {
    yield LoginDialogState(
      state: state,
      isCheckInput: (event.phoneNumber.length == 10 &&
          int.tryParse(event.phoneNumber) != null),
    );
  }

  @protected
  @override
  Stream<LoginDialogState> fetchDataState(FetchDataEvent event) async* {
    yield LoginDialogState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<LoginDialogState> refreshState(RefreshEvent event) async* {
    yield LoginDialogState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  checkPhoneNumber(String text) {
    add(CheckPhoneNumberEvent(text));
  }
}
