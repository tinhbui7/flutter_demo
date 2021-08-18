import 'package:the_coffee_house/domain/entities/section_entity.dart';

abstract class ISectionUseCase {
  Future<List<SectionEntity>?> getSection();
}
