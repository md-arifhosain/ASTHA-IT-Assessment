
import 'package:astha_it_assessment/core/network/api_clients.dart';
import 'package:astha_it_assessment/data/models/book_list_model.dart';
import 'package:astha_it_assessment/data/sources/remote/book_api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/repository/book_repository.dart';

final booksProvider =
    NotifierProvider<RecommendedNotifier, BookState>(
  RecommendedNotifier.new,
);

class RecommendedNotifier extends Notifier<BookState> {

  late BookRepository repo=BookRepository(remote: BookApiServices(apiClients: APIClients()));

  @override
  BookState build() {

    

    Future.microtask(() => fetchInitial());

    return BookState.initial();
  }

  Future<void> fetchInitial() async {

    try {

      state = state.copyWith(
        isLoading: true,
        error: null,
        books: []
      );

      final data = await repo.getBookFromGoogleApi(
        page: 1
       
      );

      state = state.copyWith(
        books: data ?? [],
        isLoading: false,
        page: 1,
        hasMore: data!=null&& data.length>=10,
      );

    } catch (e) {

      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loadMore() async {

    if (state.isLoadingMore ||
        state.isLoading ||
        !state.hasMore) {
      return;
    }

    try {

      state = state.copyWith(
        isLoadingMore: true,
      );

      final nextPage = state.page + 1;

      final data = await repo.getBookFromGoogleApi(
       page: nextPage
      );

      final newProducts = data ?? [];

      state = state.copyWith(
        books: [
          ...state.books,
          ...newProducts,
        ],
        isLoadingMore: false,
        page: nextPage,
        hasMore: newProducts.isNotEmpty&& newProducts.length>=10,
      );

    } catch (e) {

      state = state.copyWith(
        isLoadingMore: false,
        error: e.toString(),
      );
    }
  }

  Future<void> refresh() async {

    state = BookState.initial();

    await fetchInitial();
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
      books:[],
      isLoading: false,
      isLoadingMore: false,
      hasMore: true,
      page: 1,
    );
  }

  BookState copyWith({
List<BookModel> ? books,
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
