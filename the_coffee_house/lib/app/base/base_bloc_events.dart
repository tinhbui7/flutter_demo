import 'package:equatable/equatable.dart';

abstract class BaseBlocEvent extends Equatable {
  const BaseBlocEvent();

  @override
  String toString() => "BaseBlocEvent";

  @override
  List<Object?> get props {
    return [];
  }
}

class FetchDataEvent extends BaseBlocEvent {
  final bool? refresh;

  const FetchDataEvent({
    this.refresh,
  });

  @override
  List<Object?> get props {
    return [
      refresh,
    ];
  }
}

class RefreshEvent extends BaseBlocEvent {
  final bool? refresh;

  const RefreshEvent({
    this.refresh,
  });

  @override
  List<Object?> get props {
    return [
      refresh,
    ];
  }
}

class LoadNextBatchEvent extends BaseBlocEvent {}
