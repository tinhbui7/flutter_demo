import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class SelectedSizeEvent extends BaseBlocEvent {
  const SelectedSizeEvent(
    this.itemSize,
  );

  final SizeEntity itemSize;

  @override
  List<Object> get props {
    return [
      itemSize,
    ];
  }
}

class SelectedToppingEvent extends BaseBlocEvent {
  const SelectedToppingEvent(
    this.itemTopping,
  );

  final ToppingEntity itemTopping;

  @override
  List<Object> get props {
    return [
      itemTopping,
    ];
  }
}

class NoteProductEvent extends BaseBlocEvent {
  const NoteProductEvent(
    this.noteProduct,
  );

  final String noteProduct;

  @override
  List<Object> get props {
    return [
      noteProduct,
    ];
  }
}

class IncrementQuantityEvent extends BaseBlocEvent {
  const IncrementQuantityEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class DecrementQuantityEvent extends BaseBlocEvent {
  const DecrementQuantityEvent(
    this.isOrder,
  );

  final bool isOrder;

  @override
  List<Object> get props {
    return [
      isOrder,
    ];
  }
}
