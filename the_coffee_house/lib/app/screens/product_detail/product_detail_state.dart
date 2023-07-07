import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class ProductDetailState extends BaseBlocState {
  const ProductDetailState({
    this.selectedSize = const SizeEntity(),
    this.selectedTopping = const <ToppingEntity>[],
    this.noteProduct = '',
    this.quantity = 1,
  });

  final SizeEntity selectedSize;
  final List<ToppingEntity> selectedTopping;
  final String noteProduct;
  final int quantity;

  @override
  List<Object> get props {
    return [
      selectedSize,
      selectedTopping,
      noteProduct,
      quantity,
    ];
  }

  ProductDetailState copyWith({
    SizeEntity? selectedSize,
    List<ToppingEntity>? selectedTopping,
    String? noteProduct,
    int? quantity,
  }) {
    return ProductDetailState(
      selectedSize: selectedSize ?? this.selectedSize,
      selectedTopping: selectedTopping ?? this.selectedTopping,
      noteProduct: noteProduct ?? this.noteProduct,
      quantity: quantity ?? this.quantity,
    );
  }
}
