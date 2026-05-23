import 'dart:developer';

import 'package:astha_it_assessment/data/models/book_favourite_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final bookFavouriteProvider =
    NotifierProvider<FavoriteNotifier, List<BookFavouriteModel>>(
      FavoriteNotifier.new,
    );

class FavoriteNotifier extends Notifier<List<BookFavouriteModel>> {
  late Box<BookFavouriteModel> box;

  @override
  List<BookFavouriteModel> build() {
    box = Hive.box<BookFavouriteModel>('favorite_books');

    return box.values.toList();
  }

  Future<void> toggleFavorite({required BookFavouriteModel book}) async {
    final isExist = box.containsKey(book.id);

    if (isExist) {
      log("delete favourite id = ${book.id}");

      await box.delete(book.id);
    } else {
      log("add favourite id = ${book.id}");
      await box.put(book.id, book);
    }

    state = box.values.toList();
  }
}
