import 'package:json_annotation/json_annotation.dart';

part 'section_model.g.dart';

@JsonSerializable(createToJson: true)
class SectionModel {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'status')
  final String? status;

  SectionModel({
    this.id,
    this.name,
    this.status,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
}
