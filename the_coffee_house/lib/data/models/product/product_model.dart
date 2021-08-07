import 'package:json_annotation/json_annotation.dart';
import 'package:the_coffee_house/data/models/size/size_model.dart';
import 'package:the_coffee_house/data/models/topping/topping_model.dart';

part 'product_model.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: true)
class ProductModel {
  @JsonKey(name: 'section_id')
  final String? sectionId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'introduction')
  final String? intro;
  @JsonKey(name: 'size')
  final List<SizeModel>? sizes;
  @JsonKey(name: 'topping')
  final List<ToppingModel>? toppings;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'status')
  final String? status;

  ProductModel({
    this.sectionId,
    this.name,
    this.imageUrl,
    this.intro,
    this.sizes,
    this.toppings,
    this.price,
    this.status,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
