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
          ),
        );

  @override
  Stream<ProductDetailState> mapEventToState(BaseBlocEvent event) async* {
    if (event is SelectedSizeEvent) {
      yield* _setSizeSelected(event);
    } else if (event is SelectedToppingEvent) {
      yield* _setToppingSelected(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<ProductDetailState> _setSizeSelected(SelectedSizeEvent event) async* {
    yield ProductDetailState(
      state: state,
      isLoading: false,
      selectedSize: event.itemSize,
      selectedTopping: state.selectedTopping,
    );
  }

  Stream<ProductDetailState> _setToppingSelected(
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
      selectedSize: state.selectedSize,
      selectedTopping: listTopping,
    );
  }

  void setSizeSelected(SizeEntity? itemSize) {
    add(SelectedSizeEvent(itemSize));
  }

  void setToppingSelected(ToppingEntity? itemTopping) {
    add(SelectedToppingEvent(itemTopping));
  }
}
