import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/data/models/section/section_model.dart';
import 'package:the_coffee_house/data/repositories/base_repository.dart';
import 'package:the_coffee_house/domain/repositories/section_repository_i.dart';

class SectionRepository extends BaseRepository implements ISectionRepository {
  @override
  Future<List<SectionModel>?> getSection() async {
    List<SectionModel> _result = [];
    try {
      QuerySnapshot? _qrSnapshot = await fsInstance.collection('section').get();
      if (_qrSnapshot.docs.isNotEmpty == true) {
        for (final dynamic element in _qrSnapshot.docs) {
          _result.add(SectionModel.fromJson(element.data()));
        }
      }
    } catch (ex) {
      debugPrint('getSection: ${ex.toString()}');
    }
    return _result;
  }
}
