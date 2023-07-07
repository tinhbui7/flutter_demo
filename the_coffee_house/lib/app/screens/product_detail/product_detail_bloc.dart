import 'package:flutter_bloc/flutter_bloc.dart';
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

  ProductDetailBloc({required this.orderEntity}) : super(ProductDetailState()) {
    on<SelectedSizeEvent>(_setSizeSelected);
    on<SelectedToppingEvent>(_setToppingSelected);
    on<NoteProductEvent>(_setNoteProduct);
    on<IncrementQuantityEvent>(_incrementQuantity);
    on<DecrementQuantityEvent>(_decrementQuantity);
  }

  OrderEntity get orderItem {
    return OrderEntity(
      orderId: orderEntity.orderId,
      product: orderEntity.product,
      size: (state.selectedSize.name == '')
          ? state.selectedSize
          : SizeEntity(name: 'Vừa'),
      topping: state.selectedTopping,
      note: state.noteProduct,
      quantity: state.quantity,
    );
  }

  // @override
  // Stream<ProductDetailState> mapEventToState(BaseBlocEvent event) async* {
  //   if (event is SelectedSizeEvent) {
  //     yield* _setSizeSelectedState(event);
  //   } else if (event is SelectedToppingEvent) {
  //     yield* _setToppingSelectedState(event);
  //   } else if (event is NoteProductEvent) {
  //     yield* _setNoteProductState(event);
  //   } else if (event is IncrementQuantityEvent) {
  //     yield* _incrementQuantityState(event);
  //   } else if (event is DecrementQuantityEvent) {
  //     yield* _decrementQuantityState(event);
  //   } else {
  //     yield* super.mapEventToState(event);
  //   }
  // }

  void _setSizeSelected(
    SelectedSizeEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(
      ProductDetailState(
        selectedSize: event.itemSize,
      ),
    );
  }

  void _setToppingSelected(
    SelectedToppingEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    List<ToppingEntity> listTopping = state.selectedTopping ?? [];
    ToppingEntity? toppingEntity =
        listTopping.firstWhereOrNull((element) => element == event.itemTopping);
    if (toppingEntity != null) {
      listTopping.remove(event.itemTopping);
    } else {
      listTopping.add(event.itemTopping);
    }
    emit(
      ProductDetailState(
        selectedTopping: listTopping,
      ),
    );
  }

  void _setNoteProduct(
    NoteProductEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    String? note = event.noteProduct;
    if (event.noteProduct.isNotEmpty == true) {
      note = event.noteProduct.trim().replaceAll(RegExp(r'\s+'), ' ');
    }

    emit(
      ProductDetailState(
        noteProduct: note,
      ),
    );
  }

  void _incrementQuantity(
    IncrementQuantityEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(
      ProductDetailState(
        quantity: state.quantity + 1,
      ),
    );
  }

  void _decrementQuantity(
    DecrementQuantityEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    int quantity = state.quantity ?? 1;
    if (event.isOrder) {
      if (quantity > 0) {
        quantity--;
      }
    } else if (quantity > 1) {
      quantity--;
    }
    emit(
      ProductDetailState(
        quantity: quantity,
      ),
    );
  }
}
