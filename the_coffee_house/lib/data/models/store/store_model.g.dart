// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'] as int?,
      puCity: json['pu_city'] as String?,
      name: json['name'] as String?,
      openTime: json['open_time'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      fullAddress: json['full_address'] as String?,
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('pu_city', instance.puCity);
  writeNotNull('name', instance.name);
  writeNotNull('open_time', instance.openTime);
  writeNotNull('image', instance.image);
  writeNotNull('phone', instance.phone);
  writeNotNull('location', instance.location);
  writeNotNull('full_address', instance.fullAddress);
  return val;
}
