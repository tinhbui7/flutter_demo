import 'package:data/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'demo_model.g.dart';

@JsonSerializable(includeIfNull: true)
class DemoModel extends BaseModel {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;
  DemoModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory DemoModel.fromJson(Map<String, dynamic> json) =>
      _$DemoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DemoModelToJson(this);
}
