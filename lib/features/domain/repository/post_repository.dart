import 'package:clean/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entity/post_entity.dart';

abstract interface class PostRepository {
  Future<Either<Failure , Post>> getAllPosts({
    required String endpoints,
  });
}