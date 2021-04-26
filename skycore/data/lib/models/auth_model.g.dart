// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map json) {
  return $checkedNew('AuthModel', json, () {
    final val = AuthModel(
      token: $checkedConvert(json, 'token', (v) => v as String?),
    );
    return val;
  });
}

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'token': instance.token,
    };
