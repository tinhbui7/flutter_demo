import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/data/models/store/store_model.dart';
import 'package:the_coffee_house/data/repositories/base_repository.dart';
import 'package:the_coffee_house/domain/repositories/stores_repository_i.dart';

class StoreRepository extends BaseRepository implements IStoreRepository {
  @override
  Future<List<StoreModel>?> getStore() async {
    List<StoreModel> _result = [];
    try {
      QuerySnapshot? _qrSnapshot = await fsInstance.collection('stores').get();
      if (_qrSnapshot.docs.isNotEmpty == true) {
        for (final dynamic element in _qrSnapshot.docs) {
          _result.add(StoreModel.fromJson(element.data()));
        }
      }
    } catch (ex) {
      debugPrint('getStore: ${ex.toString()}');
    }
    return _result;
  }
}
