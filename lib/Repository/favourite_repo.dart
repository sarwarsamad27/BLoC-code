import '../Model/favourite_item_model.dart';

class FavoriteRepository{
  Future<List<FavoriteItemModel>> fetchItem()async{
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }
  List<FavoriteItemModel> _generateList(int length){
    return List.generate(length, (index) => FavoriteItemModel(value: 'Item $index', ID: index.toString()));
  }
}