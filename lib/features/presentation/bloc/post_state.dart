part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}


final class PostLoadingState extends PostState {}

final class PostSuccessState extends PostState {
  final Post post;
  PostSuccessState({
    required this.post,
  });
}

final class PostFailureState extends PostState {
  final String message;
  PostFailureState({
    required this.message,
  });
}