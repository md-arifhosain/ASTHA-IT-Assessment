import 'package:hive/hive.dart';

part 'book_favourite_model.g.dart';

@HiveType(typeId: 0)
class BookFavouriteModel {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final bool isFavourite;



  BookFavouriteModel({
    required this.id,
    required this.isFavourite,
  
  });
}