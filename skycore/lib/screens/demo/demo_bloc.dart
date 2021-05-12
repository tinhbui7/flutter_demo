import 'package:skycore/base/base_bloc.dart';
import 'package:skycore/base/base_bloc_events.dart';
import 'package:skycore/screens/demo/demo_state.dart';
import 'package:domain/usecases/services.dart';
import 'package:domain/entities/demo_entity.dart';

import 'demo_events.dart';

class DemoScreenBloc extends BaseBloc<DemoScreenState> {
  IDemoService? get demoService => getIt.get<IDemoService>();

  DemoScreenBloc() : super(DemoScreenState(isLoading: false));

  @override
  Stream<DemoScreenState> fetchDataState(FetchDataEvent event) async* {
    List<DemoEntity>? demos;
    try {
      demos = await demoService?.dumpJson2();
    } catch (ex) {
      logError(tag, '${ex.toString()}');
    }
    yield DemoScreenState(
      state: state,
      isLoading: false,
      demos: demos,
    );
  }

  @override
  Stream<DemoScreenState> refreshState(RefreshEvent event) async* {}

  @override
  Stream<DemoScreenState> mapEventToState(BaseBlocEvent event) async* {
    if (event is CheckedEvent) {
      yield* _checkedChangeState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<DemoScreenState> _checkedChangeState(CheckedEvent event) async* {
    yield DemoScreenState(state: state, checked: event.checked);
  }

  @override
  String get tag => 'DemoScreenBloc';

  checkedChange(bool checked) {
    add(CheckedEvent(checked));
  }
}
