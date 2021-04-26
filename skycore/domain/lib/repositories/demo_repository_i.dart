import 'package:domain/repositories/base_repository_i.dart';

abstract class IDemoRepository implements IBaseRepository {
  Future<dynamic> dumpJson();
}
