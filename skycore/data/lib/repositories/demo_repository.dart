import 'package:data/repositories/base_repository.dart';
import 'package:domain/repositories/demo_repository_i.dart';

import 'clients/demo_client.dart';

class DemoRepository extends BaseRepository<DemoClient>
    implements IDemoRepository {
  DemoRepository() {
    client = DemoClient(buildDio);
  }
  @override
  Future<dynamic> dumpJson() async {
    return await client.dumpJson();
  }

  @override
  String get subApi => '';
}
