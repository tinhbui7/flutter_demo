import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class OrderTabCubit extends Cubit<int> {
  OrderTabCubit(value) : super(value);

  void sectionItem(Iterable<ItemPosition> positions) {
    int? min;
    if (positions.isNotEmpty) {
      min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
    }
    if (state != min && min != null) {
      emit(min);
    }
  }
}
