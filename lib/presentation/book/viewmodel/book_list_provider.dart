import 'dart:developer';

import 'package:astha_it_assessment/core/network/api_clients.dart';
import 'package:astha_it_assessment/data/models/book_list_model.dart';
import 'package:astha_it_assessment/data/sources/remote/book_api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/repository/book_repository.dart';


final booksProvider = AsyncNotifierProvider<BooksNotifier, BookState>(
  BooksNotifier.new,
);

class BooksNotifier extends AsyncNotifier<BookState> {
  late BookRepository repo;

  @override
  Future<BookState> build() async {
    repo = BookRepository(remote: BookApiServices(apiClients: APIClients()));

    return await fetchInitial();
  }

  /// Initial Load
  Future<BookState> fetchInitial({String ?query}) async {
    log(" intial call ");

    try {
      final data = await repo.getBookFromGoogleApi(page: 1, query: query);

      final newState = BookState(
        books: data ?? [],
        isLoading: false,
        isLoadingMore: false,
        page: 0,
        hasMore: data != null && data.length >= 10,
        error: null,
      );

      state = AsyncData(newState);

      return newState;
    } catch (e, stack) {
      state = AsyncError(e, stack);

      rethrow;
    }
  }

  /// Load More Pagination
  Future<void> loadMore() async {
    if (!state.hasValue) return;

    final currentState = state.value!;

    if (currentState.isLoadingMore || !currentState.hasMore) {
      return;
    }
     log(" load more call ");


    try {
      /// Loading More State
      state = AsyncData(currentState.copyWith(isLoadingMore: true));

      final nextPage = currentState.page + 1;

      final data = await repo.getBookFromGoogleApi(page: nextPage);

      final newBooks = data ?? [];

      final updatedState = currentState.copyWith(
        books: [...currentState.books, ...newBooks],
        isLoadingMore: false,
        page: nextPage,
        hasMore: newBooks.isNotEmpty && newBooks.length >= 10,
      );

      state = AsyncData(updatedState);
    } catch (e, _) {
      final errorState = BookState(
        books: [],
        isLoading: false,
        isLoadingMore: false,
        hasMore: false,
        page: 0,
        error: e.toString(),
      );

      state = state = AsyncData(errorState);
    }
  }

  /// Refresh
  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await fetchInitial();
    });
  }
}

class BookState {
  final List<BookModel> books;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int page;
  final String? error;

  BookState({
    required this.books,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.page,
    this.error,
  });

  factory BookState.initial() {
    return BookState(
      books: [],
      isLoading: false,
      isLoadingMore: false,
      hasMore: true,
      page: 1,
    );
  }

  BookState copyWith({
    List<BookModel>? books,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? page,
    String? error,
  }) {
    return BookState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      error: error,
    );
  }
}
