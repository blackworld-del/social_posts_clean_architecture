import 'package:clean/core/error/failure.dart';
import 'package:clean/features/domain/entity/post_entity.dart';
import 'package:clean/features/domain/repository/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class PostsUsecases {
  late PostRepository _postRepository;

  PostsUsecases({
    required PostRepository postRepository,
  }) {
    _postRepository = postRepository;
  }

  Future<Either<Failure, Post>> getAllPosts({
    required String endpoints,
  }) async {
    return await _postRepository.getAllPosts(
      endpoints: endpoints,
    );
  }
}
