import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class ProductDetailState extends BaseBlocState {
  final SizeEntity? selectedSize;
  final List<ToppingEntity>? selectedTopping;
  ProductDetailState({
    ProductDetailState? state,
    bool? isLoading,
    SizeEntity? selectedSize,
    List<ToppingEntity>? selectedTopping,
  })  : selectedSize = selectedSize ?? state?.selectedSize,
        selectedTopping = selectedTopping ?? state?.selectedTopping,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
