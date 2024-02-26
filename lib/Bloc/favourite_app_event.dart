
import 'package:equatable/equatable.dart';

import '../Model/favourite_item_model.dart';


abstract class FavoriteAppEvent extends Equatable{
  const FavoriteAppEvent();

  @override
  List<Object> get props => [];
}

class FetchDataList extends FavoriteAppEvent{}
class Favoriteitem extends FavoriteAppEvent{
  FavoriteItemModel item;
  Favoriteitem ({required this.item});
}

class SelectItem extends FavoriteAppEvent{
  FavoriteItemModel item;
  SelectItem ({required this.item});
}

class UnSelectItem extends FavoriteAppEvent{
  FavoriteItemModel item;
  UnSelectItem ({required this.item});
}

class DeleteItem extends FavoriteAppEvent{}