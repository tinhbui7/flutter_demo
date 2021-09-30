import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/domain/domain.dart';

class CartBloc extends BaseBloc<CartState> {
  @override
  String get tag => 'CartBloc';

  CartBloc() : super(CartState(isLoading: false));

  int get totalPayment {
    return (state.orderEntities != null)
        ? (state.orderEntities!.fold(0,
            (previousValue, element) => previousValue + element.totalPayment))
        : 0;
  }

  String get productOrders {
    return (state.orderEntities != null)
        ? (state.orderEntities!.fold(
            '',
            (previousValue, element) =>
                previousValue +
                (element.product!.name ?? '') +
                ' x' +
                element.quantity.toString() +
                ((state.orderEntities!.last != element) ? ', ' : '')))
        : '';
  }

  @override
  Stream<CartState> mapEventToState(BaseBlocEvent event) async* {
    if (event is AddNewBillEvent) {
      yield* _addNewBillState(event);
    } else if (event is DeleteAllBillEvent) {
      yield* _deleteAllBillState(event);
    } else if (event is UpdateOrderItemEvent) {
      yield* _updateOrderItemState(event);
    } else if (event is DeleteOrderItemEvent) {
      yield* _deleteOrderItemState(event);
    } else {
      yield* mapEventToState(event);
    }
  }

  Stream<CartState> _addNewBillState(AddNewBillEvent event) async* {
    List<OrderEntity> _result;
    _result = state.orderEntities ?? [];
    try {
      if (event.orderEntity != null) {
        if (_result.isEmpty == true) {
          _result.add(event.orderEntity!);
        } else {
          for (var element in _result) {
            if ((event.orderEntity!.product == element.product) &&
                (event.orderEntity!.size == element.size) &&
                (event.orderEntity!.topping == element.topping) &&
                (event.orderEntity!.note == element.note)) {
              element.quantity =
                  (element.quantity ?? 0) + (event.orderEntity!.quantity ?? 0);
            } else {
              _result.add(event.orderEntity!);
            }
          }
        }
      }
    } catch (ex) {
      debugPrint('addNewCart:${ex.toString()}');
    }
    yield CartState(
      state: state,
      isLoading: false,
      orderEntities: _result,
    );
  }

  Stream<CartState> _deleteAllBillState(DeleteAllBillEvent event) async* {
    yield CartState(
      state: state,
      isLoading: false,
      orderEntities: [],
    );
  }

  Stream<CartState> _updateOrderItemState(UpdateOrderItemEvent event) async* {
    List<OrderEntity> _result = state.orderEntities ?? [];
    var index = -1;
    if (_result.isNotEmpty == true) {
      index = _result.indexWhere(
          (element) => element.orderId == event.orderEntity?.orderId);
      if (index > -1) {
        _result[index] = event.orderEntity!;
      }
    }
    yield CartState(
      state: state,
      isLoading: false,
      orderEntities: _result,
    );
  }

  Stream<CartState> _deleteOrderItemState(DeleteOrderItemEvent event) async* {
    List<OrderEntity> _result = state.orderEntities ?? [];
    var index = -1;
    if (_result.isNotEmpty == true) {
      index = _result.indexWhere(
          (element) => element.orderId == event.orderEntity?.orderId);
      if (index > -1) {
        _result.removeAt(index);
      }
    }
    yield CartState(
      state: state,
      isLoading: false,
      orderEntities: _result,
    );
  }

  void addNewBillItem(OrderEntity? orderEntity) {
    add(AddNewBillEvent(orderEntity));
  }

  void deleteAllBill() {
    add(DeleteAllBillEvent());
  }

  void updateOrderItem(OrderEntity? orderEntity) {
    add(UpdateOrderItemEvent(orderEntity));
  }

  void deleteOrderItem(OrderEntity? orderEntity) {
    add(DeleteOrderItemEvent(orderEntity));
  }
}
