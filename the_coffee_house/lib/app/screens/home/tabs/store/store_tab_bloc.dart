import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/store/store_tab_state.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';
import 'package:the_coffee_house/domain/usecases/stores/store_use_case_i.dart';

class StoreTabBloc extends BaseBloc<StoreTabState> {
  @override
  String get tag => 'StoreTabBloc';

  IStoreUseCase? get storesUseCase => getIt.get<IStoreUseCase>();

  StoreTabBloc()
      : super(StoreTabState(
          isLoading: true,
          isMapStore: false,
        ));

  @override
  Stream<StoreTabState> mapEventToState(BaseBlocEvent event) async* {
    if (event is LoadStoresDataEvent) {
      yield* _loadStoreState(event);
    } else if (event is ChangeMapStoreEvent) {
      yield* _changeMapStoreState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<StoreTabState> _loadStoreState(LoadStoresDataEvent event) async* {
    List<StoreEntity>? stores;
    try {
      stores = await storesUseCase?.getStore();
    } catch (ex) {
      logError(tag, 'loadStoreState: ${ex.toString()}');
    }
    yield StoreTabState(
      state: state,
      isLoading: false,
      stores: stores,
    );
  }

  @protected
  @override
  Stream<StoreTabState> fetchDataState(FetchDataEvent event) async* {
    yield StoreTabState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<StoreTabState> refreshState(RefreshEvent event) async* {
    yield StoreTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  Stream<StoreTabState> _changeMapStoreState(ChangeMapStoreEvent event) async* {
    yield StoreTabState(
      state: state,
      isLoading: false,
      isMapStore: state.isMapStore == false ? true : false,
    );
  }

  void loadStores() {
    add(LoadStoresDataEvent());
  }

  void changeMapStore() {
    add(ChangeMapStoreEvent());
  }
}
