import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class SelectedSizeEvent extends BaseBlocEvent {
  final SizeEntity? itemSize;

  SelectedSizeEvent(this.itemSize);
}

class SelectedToppingEvent extends BaseBlocEvent {
  final ToppingEntity? itemTopping;

  SelectedToppingEvent(this.itemTopping);
}

class NoteProductEvent extends BaseBlocEvent {
  final String? noteProduct;

  NoteProductEvent(this.noteProduct);
}

class IncrementQuantityEvent extends BaseBlocEvent {}

class DecrementQuantityEvent extends BaseBlocEvent {
  final bool isOrder;

  DecrementQuantityEvent(this.isOrder);
}
