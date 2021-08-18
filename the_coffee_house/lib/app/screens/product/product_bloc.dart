import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/product/product_state.dart';

class ProductScreenBloc extends BaseBloc<ProductScreenState> {
  ProductScreenBloc() : super(ProductScreenState(isLoading: false));

  @override
  Stream<ProductScreenState> fetchDataState(FetchDataEvent event) async* {}

  @override
  Stream<ProductScreenState> refreshState(RefreshEvent event) {
    // TODO: implement refreshState
    throw UnimplementedError();
  }

  @override
  // TODO: implement tag
  String get tag => throw UnimplementedError();
}
