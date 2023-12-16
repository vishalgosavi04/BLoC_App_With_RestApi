
part of 'posts_bloc.dart';

abstract class PostsState {}

final class PostsInitial extends PostsState {}
final class PostActionState extends PostsState{} // this State is for listeners in blocconsumer

class PostsFetchedLoadingState extends PostsState{}

class PostsFetchedErrorState extends PostsState{}

class PostsSuccessfullyFetched extends PostsState{
  List<PostDataUiModel> posts;

  PostsSuccessfullyFetched({
    required this.posts,
  });

}

class PostsAddedSuccessfulState extends PostsState{}
class PostsAddingErrorState extends PostsState{}