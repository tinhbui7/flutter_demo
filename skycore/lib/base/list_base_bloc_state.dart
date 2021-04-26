import 'base_bloc_state.dart';

class ListBaseBlocState<ItemType> extends BaseBlocState {
  final List<ItemType>? items;
  final int? batchIndex;
  final bool? hasReachedMax;
  final bool? isLoadMore;

  ListBaseBlocState({
    ListBaseBlocState<ItemType>? state,
    List<ItemType>? items,
    int? batchIndex,
    bool? hasReachedMax,
    bool? isLoadMore,
    bool? isLoading,
    bool? refreshing,
    int? timeStamp,
  })  : items = items ?? state?.items,
        batchIndex = batchIndex ?? state?.batchIndex,
        isLoadMore = isLoadMore ?? state?.isLoadMore,
        hasReachedMax = hasReachedMax ?? state?.hasReachedMax,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: timeStamp,
          refreshing: refreshing ?? state?.refreshing,
        );
}
