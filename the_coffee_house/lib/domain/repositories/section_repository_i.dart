import 'package:the_coffee_house/data/models/section/section_model.dart';
import 'package:the_coffee_house/domain/repositories/base_repository_i.dart';

abstract class ISectionRepository extends IBaseRepository {
  Future<List<SectionModel>?> getSection();
}
