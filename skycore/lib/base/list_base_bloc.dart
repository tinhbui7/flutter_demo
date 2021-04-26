import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/base/base_bloc_state.dart';

import 'base_bloc.dart';

abstract class ListBaseBloc<S extends BaseBlocState> extends BaseBloc<S> {
  ListBaseBloc(S initialState) : super(initialState);

  Stream<S> loadNextBatchDataState(LoadNextBatchEvent event);

  @override
  Stream<S> mapEventToState(BaseBlocEvent event) async* {
    if (event is LoadNextBatchEvent) {
      yield* loadNextBatchDataState(event);
    } else {
      super.mapEventToState(event);
    }
  }

  loadNextBatch() {
    add(LoadNextBatchEvent());
  }
}
