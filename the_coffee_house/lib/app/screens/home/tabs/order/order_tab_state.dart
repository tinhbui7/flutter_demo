import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class OrderTabState extends BaseBlocState {
  final List<ProductEntity>? products;

  OrderTabState({
    OrderTabState? state,
    bool? isLoading,
    List<ProductEntity>? products,
  })  : products = products ?? state?.products,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
