import 'package:equatable/equatable.dart';

class FavoriteItemModel extends Equatable{

  final String ID;
  final String value;
  final bool isDeleting;
  final bool isFavorite;

  FavoriteItemModel({
    required this.value,
    required this.ID,
    this.isDeleting = false,
    this.isFavorite = false
  } );

  FavoriteItemModel copyWith({
    String? ID ,
    String? value ,
    bool? isDeleting ,
    bool? isFavorite
  }){
    return FavoriteItemModel(
        value: value?? this.value,
        ID: ID?? this.ID ,
        isDeleting: isDeleting?? this.isDeleting ,
        isFavorite: isFavorite?? this.isFavorite
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ID , value , isDeleting , isFavorite];
}