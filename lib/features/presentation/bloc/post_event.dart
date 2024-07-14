part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

final class GetPostEvent extends PostEvent {
  final String endpoint;
  GetPostEvent({
    required this.endpoint,
  });
}
