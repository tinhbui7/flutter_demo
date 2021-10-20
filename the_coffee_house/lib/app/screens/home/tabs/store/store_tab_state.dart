import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/store_entity.dart';

class StoreTabState extends BaseBlocState {
  final List<StoreEntity>? stores;
  final bool? isMapStore;
  StoreTabState({
    StoreTabState? state,
    bool? isLoading,
    List<StoreEntity>? stores,
    bool? isMapStore,
  })  : stores = stores ?? state?.stores,
        isMapStore = isMapStore ?? state?.isMapStore,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
