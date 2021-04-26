import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable {
  final bool? isLoading;
  final bool? refreshing;
  final int? timeStamp;

  BaseBlocState({
    this.isLoading,
    this.refreshing,
    this.timeStamp,
  });

  @override
  List<Object?> get props => [
        isLoading,
        refreshing,
        timeStamp,
      ];
}
