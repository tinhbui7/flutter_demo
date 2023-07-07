import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_events.dart';
import 'package:the_coffee_house/domain/domain.dart';

import 'order_tab_state.dart';

class OrderTabBloc extends BaseBloc<OrderTabState> {
  @override
  String get tag => 'OrderTabBloc';

  IProductUseCase? get productUseCase => getIt.get<IProductUseCase>();

  OrderTabBloc() : super(OrderTabState()) {
    on<LoadProductsDataEvent>(_loadProduct);
  }

  Future<void> _loadProduct(
    LoadProductsDataEvent event,
    Emitter<OrderTabState> emit,
  ) async {
    try {
      final products = await productUseCase?.getListProductBySection();
      if (products != null) {
        emit(
          OrderTabState(
            products: products,
          ),
        );
      }
    } catch (ex) {
      logError(tag, 'loadProductState: ${ex.toString()}');
    }
  }
}
