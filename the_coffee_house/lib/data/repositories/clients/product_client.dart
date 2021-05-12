import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_coffee_house/data/models/product_model.dart';
import 'package:the_coffee_house/data/repositories/clients/base_client.dart';

part 'product_client.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/posts/1/comments')
abstract class ProductClient implements IBaseClient {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @GET('')
  Future<List<ProductModel>> getProduct();
}
