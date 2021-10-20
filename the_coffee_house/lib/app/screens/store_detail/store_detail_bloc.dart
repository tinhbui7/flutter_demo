import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/store_detail/store_detail_state.dart';

class StoreDetailBloc extends BaseBloc<StoreDetailState> {
  @override
  String get tag => 'StoreDetailBloc';

  StoreDetailBloc()
      : super(StoreDetailState(
          isLoading: false,
        ));

  @override
  Stream<StoreDetailState> mapEventToState(BaseBlocEvent event) async* {
    yield* super.mapEventToState(event);
  }
}
