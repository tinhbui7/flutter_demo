import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(createToJson: true)
class LocationModel {
  @JsonKey(name: 'lat')
  final double? latitude;
  @JsonKey(name: 'long')
  final double? longitude;

  LocationModel({
    this.latitude,
    this.longitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
