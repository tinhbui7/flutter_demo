import 'package:the_coffee_house/app/base/base_bloc_state.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class OrderTabState extends BaseBlocState {
  const OrderTabState({
    this.products = const <SectionEntity>[],
    this.sections = const <SectionEntity>[],
    this.itemSection = '',
  });

  final List<SectionEntity> products;
  final List<SectionEntity> sections;
  final String itemSection;

  @override
  List<Object> get props {
    return [
      products,
      sections,
      itemSection,
    ];
  }

  OrderTabState copyWith({
    List<SectionEntity>? products,
    List<SectionEntity>? sections,
    String? itemSection,
  }) {
    return OrderTabState(
      products: products ?? this.products,
      sections: sections ?? this.sections,
      itemSection: itemSection ?? this.itemSection,
    );
  }
}
