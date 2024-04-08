import 'package:check_bloc/Utiles/enum.dart';
import 'package:check_bloc/posts/posts_bloc.dart';
import 'package:check_bloc/posts/posts_event.dart';
import 'package:check_bloc/posts/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class post extends StatefulWidget {
  const post({super.key});

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Post Api')),
        backgroundColor: Colors.blue,
      ),

      body: BlocBuilder<PostsBloc , PostStates>(builder: (context , state){
        switch(state.postStatus){
          case PostStatus.loading:
            return Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
          case PostStatus.success:
            return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context , index){
                  final item = state.postList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.email.toString()),
                      subtitle: Text(item.body.toString()),
                      trailing: Text(item.name.toString()),
                    ),
                  );});
        }
      })
      ,
    );
  }
}
