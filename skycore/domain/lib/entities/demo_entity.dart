import 'package:data/models/demo_model.dart';

class DemoEntity {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  DemoEntity({this.postId, this.id, this.name, this.email, this.body});

  factory DemoEntity.fromModel(DemoModel? model) {
    return DemoEntity(
      postId: model?.postId,
      id: model?.id,
      name: model?.name,
      email: model?.email,
      body: model?.body,
    );
  }
}
