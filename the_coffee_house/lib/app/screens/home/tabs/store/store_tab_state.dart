import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';

class StoreTabState extends BaseBlocState {
  const StoreTabState({
    this.stores = const <StoreEntity>[],
    this.isMapStore = false,
  });

  final List<StoreEntity> stores;
  final bool isMapStore;

  @override
  List<Object> get props {
    return [
      stores,
      isMapStore,
    ];
  }

  StoreTabState copyWith({
    List<StoreEntity>? stores,
    bool? isMapStore,
  }) {
    return StoreTabState(
      stores: stores ?? this.stores,
      isMapStore: isMapStore ?? this.isMapStore,
    );
  }
}
