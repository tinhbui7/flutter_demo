import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class OrderTabState extends BaseBlocState {
  final List<ProductEntity>? products;
  final List<SectionEntity>? sections;

  OrderTabState({
    OrderTabState? state,
    bool? isLoading,
    List<ProductEntity>? products,
    List<SectionEntity>? sections,
  })  : products = products ?? state?.products,
        sections = sections ?? state?.sections,
        super(
          isLoading: isLoading ?? state?.isLoading,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
        );
}
