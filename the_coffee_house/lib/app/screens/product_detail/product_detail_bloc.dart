import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_events.dart';
import 'package:the_coffee_house/app/screens/product_detail/product_detail_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';
import 'package:collection/collection.dart';

class ProductDetailBloc extends BaseBloc<ProductDetailState> {
  @override
  String get tag => 'ProductDetailBloc';

  final OrderEntity orderEntity;

  ProductDetailBloc({required this.orderEntity})
      : super(
          ProductDetailState(
            isLoading: false,
            selectedSize: orderEntity.size == null
                ? (orderEntity.product?.sizes?.isNotEmpty == true
                    ? orderEntity.product?.sizes![0]
                    : null)
                : orderEntity.size,
            selectedTopping:
                (orderEntity.topping != null) ? orderEntity.topping : null,
            noteProduct: orderEntity.note != null ? orderEntity.note : null,
            quantity: orderEntity.quantity ?? 1,
          ),
        );

  @override
  Stream<ProductDetailState> mapEventToState(BaseBlocEvent event) async* {
    if (event is SelectedSizeEvent) {
      yield* _setSizeSelectedState(event);
    } else if (event is SelectedToppingEvent) {
      yield* _setToppingSelectedState(event);
    } else if (event is NoteProductEvent) {
      yield* _setNoteProductState(event);
    } else if (event is IncrementQuantityEvent) {
      yield* _incrementQuantityState(event);
    } else if (event is DecrementQuantityEvent) {
      yield* _decrementQuantityState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<ProductDetailState> _setSizeSelectedState(
      SelectedSizeEvent event) async* {
    yield ProductDetailState(
      state: state,
      isLoading: false,
      selectedSize: event.itemSize,
    );
  }

  Stream<ProductDetailState> _setToppingSelectedState(
      SelectedToppingEvent event) async* {
    List<ToppingEntity> listTopping = state.selectedTopping ?? [];
    ToppingEntity? toppingEntity =
        listTopping.firstWhereOrNull((element) => element == event.itemTopping);
    if (toppingEntity != null) {
      listTopping.remove(event.itemTopping);
    } else if (event.itemTopping != null) {
      listTopping.add(event.itemTopping!);
    }
    yield ProductDetailState(
      state: state,
      isLoading: false,
      selectedTopping: listTopping,
    );
  }

  Stream<ProductDetailState> _setNoteProductState(
      NoteProductEvent event) async* {
    String? note = event.noteProduct;
    if (event.noteProduct?.isNotEmpty == true) {
      note = event.noteProduct?.trim().replaceAll(RegExp(r'\s+'), ' ');
    }
    yield ProductDetailState(
      state: state,
      isLoading: false,
      noteProduct: note,
    );
  }

  Stream<ProductDetailState> _incrementQuantityState(
      IncrementQuantityEvent event) async* {
    yield ProductDetailState(
      state: state,
      isLoading: false,
      quantity: (state.quantity ?? 0) + 1,
    );
  }

  Stream<ProductDetailState> _decrementQuantityState(
      DecrementQuantityEvent event) async* {
    int quantity = state.quantity ?? 1;
    if (event.isOrder) {
      if (quantity > 0) {
        quantity--;
      }
    } else if (quantity > 1) {
      quantity--;
    }

    yield ProductDetailState(
      state: state,
      isLoading: false,
      quantity: quantity,
    );
  }

  OrderEntity get orderItem {
    return OrderEntity(
      orderId: orderEntity.orderId,
      product: orderEntity.product,
      size: (state.selectedSize != null) ? state.selectedSize : null,
      topping: state.selectedTopping,
      note: state.noteProduct,
      quantity: state.quantity,
    );
  }

  void setSizeSelected(SizeEntity? itemSize) {
    add(SelectedSizeEvent(itemSize));
  }

  void setToppingSelected(ToppingEntity? itemTopping) {
    add(SelectedToppingEvent(itemTopping));
  }

  void setNoteProduct(String noteProduct) {
    add(NoteProductEvent(noteProduct));
  }

  void incrementQuantity() {
    add(IncrementQuantityEvent());
  }

  void decrementQuantity(bool isOrder) {
    add(DecrementQuantityEvent(isOrder));
  }
}
