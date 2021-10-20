import 'package:json_annotation/json_annotation.dart';
import 'package:the_coffee_house/data/models/location_store/location_model.dart';

part 'store_model.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: true)
class StoreModel {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'pu_city')
  final String? puCity;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'open_time')
  final String? openTime;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'location')
  final LocationModel? location;
  @JsonKey(name: 'full_address')
  final String? fullAddress;

  StoreModel({
    this.id,
    this.puCity,
    this.name,
    this.openTime,
    this.image,
    this.phone,
    this.location,
    this.fullAddress,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
