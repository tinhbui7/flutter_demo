import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable {
  const BaseBlocState({
    this.isLoading,
    this.refreshing,
    this.timeStamp,
  });

  final bool? isLoading;
  final bool? refreshing;
  final int? timeStamp;

  @override
  List<Object?> get props => [
        isLoading,
        refreshing,
        timeStamp,
      ];
}
