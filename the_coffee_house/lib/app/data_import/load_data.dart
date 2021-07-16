import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:the_coffee_house/app/constants/assets.dart';

class LoadData extends StatelessWidget {
  const LoadData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _loadData,
            child: Text('Load Data'),
          )
        ],
      ),
    );
  }

  Future<String> _loadFromAsset(CollectionsDataType type) async {
    var content;
    switch (type) {
      case CollectionsDataType.products:
        try {
          content = await rootBundle.loadString(Assets.productsUrl);
        } catch (ex) {
          debugPrint('${ex.toString()}');
        }
        return content;
      case CollectionsDataType.section:
        try {
          content = await rootBundle.loadString(Assets.sectionUrl);
        } catch (ex) {
          debugPrint('${ex.toString()}');
        }
        return content;
    }
    return content;
  }

  Future<List<dynamic>> parseJson(CollectionsDataType type) async {
    String jsonString = await _loadFromAsset(type);
    final jsonResponse = jsonDecode(jsonString.toString());
    return jsonResponse;
  }

  Future<void> _loadData() async {
    final _fireStore = FirebaseFirestore.instance;
    List<dynamic> _values = await parseJson(CollectionsDataType.products);
    if (_values.isNotEmpty) {
      for (var i = 0; i < _values.length; i++) {
        await _fireStore.collection('products').add(_values[i]);
      }
    }
    List<dynamic> _section = await parseJson(CollectionsDataType.section);
    if (_section.isNotEmpty) {
      for (var i = 0; i < _section.length; i++) {
        await _fireStore.collection('section').add(_section[i]);
      }
    }
  }
}
