import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(includeIfNull: true)
class ProductModel {
  final int? id;
  final String? name;
  final double? price;
  final String? image;
  final String? description;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
