import 'package:flutter_bloc/flutter_bloc.dart';


import '../Model/favourite_item_model.dart';
import '../Repository/favourite_repo.dart';
import 'favourite_app_event.dart';
import 'favourite_app_state.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvent, FavoriteAppState> {

  List<FavoriteItemModel> favoriteItemModel = [];
  List<FavoriteItemModel> temFavoriteItemModel = [];

  FavoriteRepository favoriteRepository;
  FavoriteAppBloc(this.favoriteRepository) : super(FavoriteAppState()) {
    on<FetchDataList>(fetchList);
    on<Favoriteitem>(favoriteItem);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItem>(deleteItem);
  }
  void fetchList(FetchDataList event, Emitter<FavoriteAppState> emit) async {
    favoriteItemModel = await favoriteRepository.fetchItem();
    emit(state.copyWith(
        favoriteItemModel: List.from(favoriteItemModel),
        listStatus: ListStatus.successful));
  }

  void favoriteItem(Favoriteitem event, Emitter<FavoriteAppState> emit) async {
    final index =
    favoriteItemModel.indexWhere((element) => element.ID == event.item.ID);

    if(event.item.isFavorite){
      if(temFavoriteItemModel.contains(favoriteItemModel[index])){
        temFavoriteItemModel.remove(favoriteItemModel[index]);
        temFavoriteItemModel.add(event.item);
      }
    }else{
      if(temFavoriteItemModel.contains(favoriteItemModel[index])){
        temFavoriteItemModel.remove(favoriteItemModel[index]);
        temFavoriteItemModel.add(event.item);
      }
    }


    favoriteItemModel[index] = event.item;
    emit(state.copyWith(favoriteItemModel: List.from(favoriteItemModel) , temFavoriteItemModel: List.from(temFavoriteItemModel)));
  }


  void selectItem(SelectItem event, Emitter<FavoriteAppState> emit) async {
    temFavoriteItemModel.add(event.item);
    emit(state.copyWith(temFavoriteItemModel: List.from(temFavoriteItemModel)));
  }

  void unSelectItem(UnSelectItem event, Emitter<FavoriteAppState> emit) async {
    temFavoriteItemModel.remove(event.item);
    emit(state.copyWith(favoriteItemModel: List.from(favoriteItemModel)));
  }

  void deleteItem(DeleteItem event, Emitter<FavoriteAppState> emit) async {
    for(int i = 0 ; i < temFavoriteItemModel.length ; i++){
      favoriteItemModel.remove(temFavoriteItemModel[i]);
    }
    temFavoriteItemModel.clear();
    emit(state.copyWith(favoriteItemModel: List.from(favoriteItemModel),
        temFavoriteItemModel: List.from(temFavoriteItemModel)
    ));
  }
}
