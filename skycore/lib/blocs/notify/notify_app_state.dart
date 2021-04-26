import 'package:skycore/base/base_bloc_state.dart';

enum AppNotifyType { INFO, ERROR }

class NotifyAppState extends BaseBlocState {
  final AppNotifyType? type;
  final String? message;

  NotifyAppState({
    NotifyAppState? state,
    this.type,
    this.message,
    bool? isLoading,
  }) : super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
