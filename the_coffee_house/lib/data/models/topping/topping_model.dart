import 'package:json_annotation/json_annotation.dart';

part 'topping_model.g.dart';

@JsonSerializable(createToJson: true)
class ToppingModel {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'extra_pay')
  final int? extraPay;

  ToppingModel(
    this.name,
    this.extraPay,
  );

  factory ToppingModel.fromJson(Map<String, dynamic> json) =>
      _$ToppingModelFromJson(json);
  Map<String, dynamic> toJson() => _$ToppingModelToJson(this);
}
