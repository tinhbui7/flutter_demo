import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/home_events.dart';
import 'package:the_coffee_house/app/screens/home/home_state.dart';
import 'package:the_coffee_house/domain/usecases/product/product_use_case_i.dart';

class HomeScreenBloc extends BaseBloc<HomeScreenState> {
  @override
  String get tag => 'HomeScreenBloc';

  final _messageKey = 'message';
  IProductUseCase? get demoService => getIt.get<IProductUseCase>();

  HomeScreenBloc() : super(HomeScreenState(isLoading: true));

  @override
  Stream<HomeScreenState> mapEventToState(BaseBlocEvent event) async* {
    if (event is SaveMessageEvent) {
      yield* _saveMessageState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<HomeScreenState> _saveMessageState(SaveMessageEvent event) async* {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      await localStorageService.set(_messageKey, event.message);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'saveMessageState: ${ex.toString()}');
    }
    yield* fetchData(refresh: true);
  }

  @protected
  @override
  Stream<HomeScreenState> fetchDataState(FetchDataEvent event) async* {
    var message;
    try {
      message = await localStorageService.get(_messageKey);
    } catch (ex) {
      handleException(ex);
      logError(tag, 'fetchDataState getMessage ${ex.toString()}');
    }
    yield HomeScreenState(
      state: state,
      message: message?.toString(),
      isLoading: false,
    );
  }

  @override
  Stream<HomeScreenState> refreshState(RefreshEvent event) async* {
    yield HomeScreenState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  saveMessage(String message) {
    add(SaveMessageEvent(message));
  }
}
