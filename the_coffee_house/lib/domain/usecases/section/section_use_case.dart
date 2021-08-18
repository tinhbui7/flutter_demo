import 'package:the_coffee_house/core/mappers/entity_mappers.dart';
import 'package:the_coffee_house/domain/entities/section_entity.dart';
import 'package:the_coffee_house/domain/repositories/section_repository_i.dart';
import 'package:the_coffee_house/domain/usecases/base_use_case.dart';
import 'package:the_coffee_house/domain/usecases/section/section_use_case_i.dart';

class SectionUseCase extends BaseUseCase<ISectionRepository>
    implements ISectionUseCase {
  @override
  String get tag => 'SectionService';

  @override
  Future<List<SectionEntity>?> getSection() async {
    final models = await repository?.getSection();
    return EntityMappers.toListSectionEntityFromModels(models);
  }
}
