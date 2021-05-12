abstract class BaseBlocEvent {
  BaseBlocEvent();

  @override
  String toString() => "BaseBlocEvent";
}

class FetchDataEvent extends BaseBlocEvent {
  final bool? refresh;

  FetchDataEvent(this.refresh);
}

class RefreshEvent extends BaseBlocEvent {
  final bool? refresh;

  RefreshEvent(this.refresh);
}

class LoadNextBatchEvent extends BaseBlocEvent {}
