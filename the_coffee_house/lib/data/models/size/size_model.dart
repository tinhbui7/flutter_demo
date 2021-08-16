import 'package:json_annotation/json_annotation.dart';

part 'size_model.g.dart';

@JsonSerializable(createToJson: true)
class SizeModel {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'extra_pay')
  final int? extraPay;

  SizeModel(
    this.name,
    this.extraPay,
  );

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
  Map<String, dynamic> toJson() => _$SizeModelToJson(this);
}
