import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/product_entity.dart';

class ProductScreenState extends BaseBlocState {
  final bool? checked;
  final List<ProductEntity>? product;
  ProductScreenState({
    ProductScreenState? state,
    bool? checked,
    List<ProductEntity>? product,
    bool? isLoading,
  })  : checked = checked ?? state?.checked,
        product = product ?? state?.product,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
