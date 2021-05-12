// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoModel _$DemoModelFromJson(Map json) {
  return $checkedNew('DemoModel', json, () {
    final val = DemoModel(
      postId: $checkedConvert(json, 'postId', (v) => v as int?),
      id: $checkedConvert(json, 'id', (v) => v as int?),
      name: $checkedConvert(json, 'name', (v) => v as String?),
      email: $checkedConvert(json, 'email', (v) => v as String?),
      body: $checkedConvert(json, 'body', (v) => v as String?),
    );
    return val;
  });
}

Map<String, dynamic> _$DemoModelToJson(DemoModel instance) => <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
