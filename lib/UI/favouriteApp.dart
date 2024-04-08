import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/favourite_app_bloc.dart';
import '../Bloc/favourite_app_event.dart';
import '../Bloc/favourite_app_state.dart';
import '../Model/favourite_item_model.dart';



class favoriteApp extends StatefulWidget {
  const favoriteApp({super.key});

  @override
  State<favoriteApp> createState() => _favoriteAppState();
}

class _favoriteAppState extends State<favoriteApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoriteAppBloc>().add(FetchDataList());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite App'),
        centerTitle: true,
        actions: [
          BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
            builder: (context, state) {
              return Visibility(
                  visible: state.temFavoriteItemModel.isEmpty? false : true,
                  child: IconButton(onPressed: (){context.read<FavoriteAppBloc>().add(DeleteItem());}, icon: Icon(Icons.delete)));
            },
          )
        ],
      ),
      body: BlocBuilder<FavoriteAppBloc, FavoriteAppState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator());
            case ListStatus.fail:
              return Text('something went wrong');
            case ListStatus.successful:
              return ListView.builder(
                  itemCount: state.favoriteItemModel.length,
                  itemBuilder: (context, index) {
                    final item = state.favoriteItemModel[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            value: state.temFavoriteItemModel.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if(value!){
                                context.read<FavoriteAppBloc>().add(SelectItem(item: item));
                              }else{
                                context.read<FavoriteAppBloc>().add(UnSelectItem(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavoriteItemModel favoriteItemModel =
                              FavoriteItemModel(
                                  value: item.value,
                                  ID: item.ID,
                                  isFavorite:
                                  item.isFavorite ? false : true);

                              context
                                  .read<FavoriteAppBloc>()
                                  .add(Favoriteitem(item: favoriteItemModel));
                            },
                            icon: Icon(
                              item.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                            )),
                      ),
                    );
                  });
          }
        },
      ),

    );
  }
}
