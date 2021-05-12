import 'package:skycore/base/base_bloc_state.dart';
import 'package:domain/entities/demo_entity.dart';

class DemoScreenState extends BaseBlocState {
  final bool? checked;
  final List<DemoEntity>? demos;
  DemoScreenState({
    DemoScreenState? state,
    bool? checked,
    List<DemoEntity>? demos,
    bool? isLoading,
  })  : checked = checked ?? state?.checked,
        demos = demos ?? state?.demos,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
