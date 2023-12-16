import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:restapi_with_flutterbloc/features/posts/models/post_data_ui_model.dart';
import 'package:restapi_with_flutterbloc/features/posts/repos/post_repo.dart';
part 'posts_event.dart';
part 'posts_state.dart';
class PostsBloc extends Bloc<PostsEvent,PostsState>{
  PostsBloc(): super(PostsInitial()){
    on<Initialfetchevent> (initialfetchevent);
    on<PostsAddevent>(postsaddevent);
  }
  Future<FutureOr<void>> initialfetchevent(Initialfetchevent event, Emitter<PostsState> emit) async {
    emit(PostsFetchedLoadingState());
      List<PostDataUiModel> posts = await Posts_Repo.fetchPosts();
      emit(PostsSuccessfullyFetched(posts: posts));
      print(posts);
  }

  FutureOr<void> postsaddevent(PostsAddevent event, Emitter<PostsState> emit) async{
    bool success = await Posts_Repo.addposts();
    print(success);
    if(success){
      emit(PostsAddedSuccessfulState());
    }
    else{
      emit(PostsAddingErrorState());
    }
    
  }
}