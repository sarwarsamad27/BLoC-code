import 'package:equatable/equatable.dart';

import '../Model/favourite_item_model.dart';


enum ListStatus { loading, successful, fail }

class FavoriteAppState extends Equatable {
  final List<FavoriteItemModel> favoriteItemModel;
  final List<FavoriteItemModel> temFavoriteItemModel;
  final ListStatus listStatus;

  FavoriteAppState(
      {this.favoriteItemModel = const [],
        this.temFavoriteItemModel = const [],
        this.listStatus = ListStatus.loading});

  FavoriteAppState copyWith(
      {List<FavoriteItemModel>? favoriteItemModel,
        List<FavoriteItemModel>? temFavoriteItemModel,
        ListStatus? listStatus}) {
    return FavoriteAppState(
        favoriteItemModel: favoriteItemModel ?? this.favoriteItemModel,
        temFavoriteItemModel: temFavoriteItemModel ?? this.temFavoriteItemModel,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favoriteItemModel, temFavoriteItemModel , listStatus];
}
