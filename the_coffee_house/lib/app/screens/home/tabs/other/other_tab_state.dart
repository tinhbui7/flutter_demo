import 'package:the_coffee_house/app/base/base_bloc_state.dart';

class OtherTabState extends BaseBlocState {
  OtherTabState({OtherTabState? state, bool? isLoading})
      : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
