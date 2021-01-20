part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState([List props = const []]);

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> postList;

  const PostLoaded({@required this.postList}) : assert(postList != null);

  @override
  List<Object> get props => [postList];
}

class PostError extends PostState {
  final String error;

  const PostError(this.error);

  @override
  List<Object> get props => [error];
}
