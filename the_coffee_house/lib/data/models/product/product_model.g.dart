// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      sectionId: json['section_id'] as String?,
      name: json['name'] as String?,
      imageUrl: json['image_url'] as String?,
      intro: json['introduction'] as String?,
      sizes: (json['size'] as List<dynamic>?)
          ?.map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      toppings: (json['topping'] as List<dynamic>?)
          ?.map((e) => ToppingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('section_id', instance.sectionId);
  writeNotNull('name', instance.name);
  writeNotNull('image_url', instance.imageUrl);
  writeNotNull('introduction', instance.intro);
  writeNotNull('size', instance.sizes);
  writeNotNull('topping', instance.toppings);
  writeNotNull('price', instance.price);
  writeNotNull('status', instance.status);
  return val;
}
