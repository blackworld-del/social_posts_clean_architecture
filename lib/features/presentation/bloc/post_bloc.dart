// ignore_for_file: depend_on_referenced_packages

import 'package:clean/features/domain/entity/post_entity.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:clean/features/domain/use%20cases/posts_usecases.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsUsecases _postsUsecases;
  PostBloc({
    required PostsUsecases postsUsecases,
  })  : _postsUsecases = postsUsecases,
        super(
          PostInitial(),
        ) {
    on<PostEvent>(
      (_, emit) => emit(
        PostLoadingState(),
      ),
    );
    on<GetPostEvent>(_getPost);
  }

  void _getPost(
    GetPostEvent event,
    Emitter<PostState> emit,
  ) async {
    final response = await _postsUsecases.getAllPosts(
      endpoints: event.endpoint,
    );
    response.fold(
      (error) {
        emit(
          PostFailureState(
            message: error.message,
          ),
        );
      },
      (success) {
        print(success);
        emit(
          PostSuccessState(
            post: success,
          ),
        );
      },
    );
  }
}
