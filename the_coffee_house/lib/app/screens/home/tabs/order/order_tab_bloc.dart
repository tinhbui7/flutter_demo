import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_events.dart';
import 'package:the_coffee_house/domain/domain.dart';

import 'order_tab_state.dart';

class OrderTabBloc extends BaseBloc<OrderTabState> {
  @override
  String get tag => 'OrderTabBloc';

  IProductUseCase? get productUseCase => getIt.get<IProductUseCase>();

  OrderTabBloc() : super(OrderTabState(isLoading: true));

  @override
  Stream<OrderTabState> mapEventToState(BaseBlocEvent event) async* {
    if (event is LoadProductsDataEvent) {
      yield* _loadProductState(event);
    } else if (event is AddLocalSectionEvent) {
      yield* _addLocalSectionState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<OrderTabState> _loadProductState(LoadProductsDataEvent event) async* {
    List<SectionEntity>? products;
    try {
      products = await productUseCase?.getListProductBySection();
    } catch (ex) {
      logError(tag, 'loadProductState: ${ex.toString()}');
    }
    yield OrderTabState(
      state: state,
      products: products,
      isLoading: false,
    );
  }

  Stream<OrderTabState> _addLocalSectionState(
      AddLocalSectionEvent event) async* {
    yield OrderTabState(
      state: state,
      itemSection: event.itemSection,
      isLoading: false,
    );
  }

  @protected
  @override
  Stream<OrderTabState> fetchDataState(FetchDataEvent event) async* {
    yield OrderTabState(
      state: state,
      isLoading: false,
    );
  }

  @override
  Stream<OrderTabState> refreshState(RefreshEvent event) async* {
    yield OrderTabState(
      state: state,
      isLoading: !(event.refresh == true),
    );
  }

  int indexOld = -1;
  void sectionItems(Iterable<ItemPosition> positions) {
    int? min;
    if (positions.isNotEmpty) {
      min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
    }
    if (indexOld != min && min != null) {
      String? itemSection = state.products?.asMap()[min]?.name;
      indexOld = min;
      if (itemSection?.isNotEmpty == true) {
        addLocalSection(itemSection!);
      }
    }
  }

  loadProduct() {
    add(LoadProductsDataEvent());
  }

  addLocalSection(String itemSection) {
    add(AddLocalSectionEvent(itemSection));
  }
}
