import 'package:domain/repositories/base_repository_i.dart';
import 'package:data/models/demo_model.dart';

abstract class IDemoRepository implements IBaseRepository {
  Future<dynamic> dumpJson();

  Future<List<DemoModel>> dumpJson2();
}
