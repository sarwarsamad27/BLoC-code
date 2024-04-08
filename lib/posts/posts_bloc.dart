import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:check_bloc/Repository/post_repository.dart';
import 'package:check_bloc/Utiles/enum.dart';
import 'package:check_bloc/posts/posts_event.dart';
import 'package:check_bloc/posts/posts_state.dart';




class PostsBloc extends Bloc<PostsEvent, PostStates> {
  Repositories repositories = Repositories();
  PostsBloc() : super(PostStates()) {
    on<PostFetched>(fetchedPost);
  }

  void fetchedPost (PostFetched event , Emitter<PostStates> emit)async{
    await repositories.fetchPost().then((value){
      emit(state.copyWith(postStatus: PostStatus.success , message: 'success', postList: value));
    }).onError((error, stackTrace) {
emit(state.copyWith(postStatus: PostStatus.failure , message: error.toString()));
    });
  }
}
