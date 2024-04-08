

import 'package:check_bloc/Utiles/enum.dart';
import 'package:equatable/equatable.dart';

import '../Model/PostModel.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<postModel> postList;
  final String message;

  const PostStates({
    this.postStatus = PostStatus.loading,

    this.postList = const <postModel>[],
    this.message = '',
});
  PostStates copyWith({PostStatus? postStatus , List<postModel>? postList , String? message}){
return PostStates(
postList: postList ?? this.postList,
postStatus:postStatus ?? this.postStatus ,
message: message ?? this.message,
);

}

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus , postStatus];

}