// ignore_for_file: implementation_imports

import 'package:clean/core/error/failure.dart';
import 'package:clean/core/exceptions/api_exception.dart';
import 'package:clean/features/data/data%20sources/post_remote_data_source.dart';
import 'package:clean/features/domain/entity/post_entity.dart';
import 'package:clean/features/domain/repository/post_repository.dart';
import 'package:fpdart/src/either.dart';

class PostRepositoryImpl implements PostRepository {
  late PostRemoteDataSource _postRemoteDataSource;

  PostRepositoryImpl({
    required PostRemoteDataSource postRemoteDataSource,
  }) {
    _postRemoteDataSource = postRemoteDataSource;
  }

  @override
  Future<Either<Failure, Post>> getAllPosts({
    required String endpoints,
  }) async {
    try {
      final postFetchResult = await _postRemoteDataSource.getAllPosts(
        endpoints: endpoints,
      );
      return right(
        postFetchResult,
      );
    } on ApiException catch (e) {
      return left(
        Failure(
          e.message,
        ),
      );
    } catch (e) {
      return left(
        Failure(
          e.toString(),
        ),
      );
    }
  }
}
