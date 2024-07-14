import 'package:clean/features/domain/entity/post_entity.dart';

class PostModels extends Post {
  PostModels({
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostModels.fromJson({
    required Map<String, dynamic> postsMap,
  }) {
    return PostModels(
      id: postsMap['id'] ?? '',
      title: postsMap['title'] ?? '',
      body: postsMap['body'] ?? '',
    );
  }
}
