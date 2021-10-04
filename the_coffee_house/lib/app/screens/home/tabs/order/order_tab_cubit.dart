import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/domain/entities/section_entity.dart';

class OrderTabCubit extends Cubit<String?> {
  OrderTabCubit() : super('');

  int indexOld = -1;
  String? oldItem;

  void sectionItem(
      Iterable<ItemPosition> positions, List<SectionEntity> products) {
    String? item;
    int? min;
    if (positions.isNotEmpty) {
      min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
    }
    if (indexOld != min && min != null) {
      String? itemSection = products.asMap()[min]?.name;
      indexOld = min;
      if (itemSection?.isNotEmpty == true) {
        item = itemSection;
        oldItem = item;
      }
    }
    emit(item ?? oldItem);
  }
}
