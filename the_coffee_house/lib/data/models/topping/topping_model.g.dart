// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToppingModel _$ToppingModelFromJson(Map<String, dynamic> json) {
  return ToppingModel(
    json['name'] as String?,
    json['extra_pay'] as int?,
  );
}

Map<String, dynamic> _$ToppingModelToJson(ToppingModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'extra_pay': instance.extraPay,
    };
