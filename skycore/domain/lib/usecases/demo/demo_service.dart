import 'package:domain/repositories/demo_repository_i.dart';
import 'package:domain/usecases/demo/demo_service_i.dart';

import '../base_service.dart';

class DemoService extends BaseService<IDemoRepository> implements IDemoService {
  String get tag => 'DemoService';

  @override
  Future<dynamic> dumpJson() async {
    return await repository?.dumpJson();
  }
}
