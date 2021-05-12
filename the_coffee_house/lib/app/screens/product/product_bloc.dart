import 'package:the_coffee_house/app/base/base_bloc.dart';
import 'package:the_coffee_house/app/base/base_bloc_events.dart';
import 'package:the_coffee_house/app/screens/product/product_state.dart';
import 'package:the_coffee_house/domain/entities/product_entity.dart';
import 'package:the_coffee_house/domain/usecases/product/product_use_case_i.dart';

class ProductScreenBloc extends BaseBloc<ProductScreenState> {
  IProductUseCase? get productUseCase => getIt.get<IProductUseCase>();

  ProductScreenBloc() : super(ProductScreenState(isLoading: false));

  @override
  Stream<ProductScreenState> fetchDataState(FetchDataEvent event) async* {
    List<ProductEntity>? product;
  }

  @override
  Stream<ProductScreenState> refreshState(RefreshEvent event) {
    // TODO: implement refreshState
    throw UnimplementedError();
  }

  @override
  // TODO: implement tag
  String get tag => throw UnimplementedError();
}
