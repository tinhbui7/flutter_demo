import 'package:the_coffee_house/app/base/base_bloc_events.dart';

class LoadProductsDataEvent extends BaseBlocEvent {}

class LoadSectionDataEvent extends BaseBlocEvent {}

class AddLocalSectionEvent extends BaseBlocEvent {
  final String itemSection;

  AddLocalSectionEvent(this.itemSection);
}
