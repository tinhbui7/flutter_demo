import 'package:domain/entities/demo_entity.dart';
import 'package:domain/repositories/demo_repository_i.dart';

import '../base_service.dart';

abstract class IDemoService {
  Future<dynamic> dumpJson();

  Future<List<DemoEntity>?> dumpJson2();
}
