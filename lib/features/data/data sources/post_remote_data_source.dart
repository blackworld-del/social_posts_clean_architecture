import '../models/post_models.dart';

abstract interface class PostRemoteDataSource {
  Future<PostModels> getAllPosts({
    required String endpoints,
  });
}