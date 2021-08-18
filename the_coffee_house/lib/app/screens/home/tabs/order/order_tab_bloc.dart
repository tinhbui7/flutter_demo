import 'package:flutter/cupertino.dart';
import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/home/tabs/order/order_tab_events.dart';
import 'package:the_coffee_house/domain/domain.dart';
import 'package:the_coffee_house/domain/usecases/section/section_use_case_i.dart';

import 'order_tab_state.dart';

class OrderTabBloc extends BaseBloc<OrderTabState> {
  @override
  String get tag => 'OrderTabBloc';

  IProductUseCase? get productUseCase => getIt.get<IProductUseCase>();
  ISectionUseCase? get sectionUseCase => getIt.get<ISectionUseCase>();

  OrderTabBloc() : super(OrderTabState(isLoading: true));

  @override
  Stream<OrderTabState> mapEventToState(BaseBlocEvent event) async* {
    if (event is LoadProductsDataEvent) {
      yield* _loadProductState(event);
    } else if (event is LoadSectionDataEvent) {
      yield* _loadSectionState(event);
    } else {
      yield* super.mapEventToState(event);
    }
  }

  Stream<OrderTabState> _loadProductState(LoadProductsDataEvent event) async* {
    List<ProductEntity>? products;
    try {
      products = await productUseCase?.getProduct();
    } catch (ex) {
      logError(tag, 'loadProductState: ${ex.toString()}');
    }
    yield OrderTabState(
      state: state,
      products: products,
      isLoading: false,
    );
  }

  Stream<OrderTabState> _loadSectionState(LoadSectionDataEvent event) async* {
    List<SectionEntity>? sections;
    try {
      sections = await sectionUseCase?.getSection();
    } catch (ex) {
      logError(tag, 'loadSectionState: ${ex.toString()}');
    }
    yield OrderTabState(
      state: state,
      sections: sections,
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

  loadProduct() {
    add(LoadProductsDataEvent());
  }

  loadSection() {
    add(LoadSectionDataEvent());
  }
}
