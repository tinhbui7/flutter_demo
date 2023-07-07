import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_events.dart';
import 'package:the_coffee_house/app/blocs/cart/cart_state.dart';
import 'package:the_coffee_house/domain/domain.dart';

class CartBloc extends BaseBloc<CartState> {
  @override
  String get tag => 'CartBloc';

  CartBloc() : super(CartState()) {
    on<AddNewBillEvent>(_addNewBill);
    on<DeleteAllBillEvent>(_deleteAllBill);
    on<UpdateOrderItemEvent>(_updateOrderItem);
    on<DeleteOrderItemEvent>(_deleteOrderItem);
    on<AddAddressEvent>(_addAddress);
    on<AddStoreAddressEvent>(_addStoreAddress);
    on<ChangeOrderMethodEvent>(_changeOrderMethod);
    on<ChangeSaveAddressEvent>(_changeSaveAddress);
  }

  int get totalPayment {
    return state.orderEntities.fold(
      0,
      (previousValue, element) => previousValue + element.totalPayment,
    );
  }

  String get productOrders {
    return state.orderEntities.fold(
      '',
      (previousValue, element) =>
          previousValue +
          (element.product!.name ?? '') +
          ' x' +
          element.quantity.toString() +
          ((state.orderEntities.last != element) ? ', ' : ''),
    );
  }

  int get totalQuantity {
    return state.orderEntities.fold(
      0,
      (previousValue, element) => previousValue + (element.quantity ?? 0),
    );
  }

  void _addNewBill(
    AddNewBillEvent event,
    Emitter<CartState> emit,
  ) async {
    List<OrderEntity> _result;
    _result = state.orderEntities ?? [];
    bool isUpdate = false;
    Function equal = const ListEquality().equals;
    if (_result.isEmpty == true) {
      _result.add(event.orderEntity);
    } else {
      for (var element in _result) {
        if ((event.orderEntity.product?.name == element.product?.name) &&
            (event.orderEntity.size?.name == element.size?.name) &&
            equal(event.orderEntity.topping, element.topping) &&
            (event.orderEntity.note == element.note)) {
          element.quantity =
              (element.quantity ?? 0) + (event.orderEntity.quantity ?? 0);
          isUpdate = true;
          break;
        }
      }
      if (isUpdate == false) {
        _result.add(event.orderEntity);
      }
    }
    emit(
      CartState(
        orderEntities: _result,
      ),
    );
  }

  void _deleteAllBill(
    DeleteAllBillEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      CartState(
        orderEntities: [],
      ),
    );
  }

  void _updateOrderItem(
    UpdateOrderItemEvent event,
    Emitter<CartState> emit,
  ) async {
    List<OrderEntity> _result = state.orderEntities ?? [];
    var index = -1;
    if (_result.isNotEmpty == true) {
      index = _result.indexWhere(
          (element) => element.orderId == event.orderEntity.orderId);
      if (index > -1) {
        _result[index] = event.orderEntity;
      }
    }
    emit(
      CartState(
        orderEntities: _result,
      ),
    );
  }

  void _deleteOrderItem(
    DeleteOrderItemEvent event,
    Emitter<CartState> emit,
  ) async {
    List<OrderEntity> _result = state.orderEntities ?? [];
    var index = -1;
    if (_result.isNotEmpty == true) {
      index = _result.indexWhere(
          (element) => element.orderId == event.orderEntity.orderId);
      if (index > -1) {
        _result.removeAt(index);
      }
    }
    emit(
      CartState(
        orderEntities: _result,
      ),
    );
  }

  void _addAddress(
    AddAddressEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      CartState(
        deliveryEntity: DeliveryEntity(
          address: event.address,
          street: event.nameStreet,
        ),
        orderType: OrderType.DELIVERY,
      ),
    );
  }

  void _addStoreAddress(
    AddStoreAddressEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      CartState(
        storeEntity: event.storeEntity,
        orderType: OrderType.PICKUP,
      ),
    );
  }

  void _changeOrderMethod(
    ChangeOrderMethodEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      CartState(
        orderType: event.orderType,
      ),
    );
  }

  void _changeSaveAddress(
    ChangeSaveAddressEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(
      CartState(
        isSaveAddress: event.value,
      ),
    );
  }
}
