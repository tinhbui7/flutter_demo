import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  StoreTabBloc() : super(StoreTabState()) {
    on<LoadStoresDataEvent>(_loadStore);
    on<ChangeMapStoreEvent>(_changeMapStore);
  }

  Future<void> _loadStore(
    LoadStoresDataEvent event,
    Emitter<StoreTabState> emit,
  ) async {
    try {
      List<StoreEntity>? stores = await storesUseCase?.getStore();
      if (stores is List<StoreEntity>) {
        emit(
          StoreTabState(
            stores: stores,
          ),
        );
      }
    } catch (ex) {
      logError(tag, 'loadStoreState: ${ex.toString()}');
    }
  }

  void _changeMapStore(
    ChangeMapStoreEvent event,
    Emitter<StoreTabState> emit,
  ) {
    var isMapStore = false;
    if (!state.isMapStore) {
      isMapStore = true;
    }
    emit(
      StoreTabState(
        isMapStore: isMapStore,
      ),
    );
  }
  void changeMapStore() {
    add(ChangeMapStoreEvent());
  }
}
