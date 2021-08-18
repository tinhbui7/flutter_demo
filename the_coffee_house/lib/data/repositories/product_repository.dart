import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/data/models/product/product_model.dart';
import 'package:the_coffee_house/data/repositories/base_repository.dart';
import 'package:the_coffee_house/domain/repositories/product_repository_i.dart';

class ProductRepository extends BaseRepository implements IProductRepository {
  @override
  Future<List<ProductModel>?> getProduct() async {
    List<ProductModel> _result = [];
    try {
      QuerySnapshot? _qrSnapshot = await fsInstance
          .collection('products')
          .orderBy('section_id', descending: false)
          .get();
      if (_qrSnapshot.docs.isNotEmpty == true) {
        for (final dynamic element in _qrSnapshot.docs) {
          _result.add(ProductModel.fromJson(element.data()));
        }
      }
    } catch (ex) {
      debugPrint('getProduct: ${ex.toString()}');
    }
    return _result;
  }
}
