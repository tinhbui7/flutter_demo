import 'package:domain/entities/demo_entity.dart';
import 'package:domain/repositories/demo_repository_i.dart';
import 'package:domain/usecases/demo/demo_service_i.dart';

import '../base_service.dart';

class DemoService extends BaseService<IDemoRepository> implements IDemoService {
  String get tag => 'DemoService';

  @override
  Future<dynamic> dumpJson() async {
    return await repository?.dumpJson();
  }

  @override
  Future<List<DemoEntity>?> dumpJson2() async {
    var models = await repository?.dumpJson2();
    return models?.map((e) => DemoEntity.fromModel(e)).toList();
  }
}
