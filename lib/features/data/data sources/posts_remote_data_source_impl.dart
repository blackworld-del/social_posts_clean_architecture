import 'package:clean/core/exceptions/api_exception.dart';
import 'package:clean/features/data/data%20sources/post_remote_data_source.dart';
import 'package:clean/features/data/models/post_models.dart';
import 'package:dio/dio.dart';

class PostsRemoteDataSourceImpl implements PostRemoteDataSource {
  late Dio _dio;

  PostsRemoteDataSourceImpl({
    required Dio dio,
  }) {
    _dio = dio;
  }
  @override
  Future<PostModels> getAllPosts({
    required String endpoints,
  }) async {
    try {
      final postsResponse = await _dio.get(endpoints);
      return PostModels.fromJson(
        postsMap: postsResponse.data,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.message!,
      );
    } catch (e) {
      throw ApiException(
        message: e.toString(),
      );
    } 
  }
}
