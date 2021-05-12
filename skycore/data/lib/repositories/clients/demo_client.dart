import 'package:data/data.dart';
import 'package:data/repositories/clients/base_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'demo_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/todos/')
abstract class DemoClient implements IBaseClient {
  factory DemoClient(Dio dio, {String baseUrl}) = _DemoClient;

  @GET('/1')
  Future<dynamic> dumpJson();

  @GET('https://jsonplaceholder.typicode.com/posts/1/comments')
  Future<List<DemoModel>> dumpJson2();
}
