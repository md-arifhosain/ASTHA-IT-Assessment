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

  /// Add / Remove Favorite
  Future<void> toggleFavorite({required BookFavouriteModel book}) async {
    log("called id = ${book.id}");

    final isExist = box.containsKey(book.id);

    if (isExist) {
      log("delete id = ${book.id}");

      await box.delete(book.id);
    } else {
      log("add id = ${book.id}");
      await box.put(book.id, book);
    }

    state = box.values.toList();
  }

  /// Check Favorite
  bool isFavorite({required String bookId}) {
    log("Check id = $bookId");
    if (bookId == '') {
      return false;
    }

    return box.containsKey(bookId);
  }
}
