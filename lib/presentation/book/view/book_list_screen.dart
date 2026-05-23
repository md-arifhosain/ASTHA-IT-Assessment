// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/resources/color_manager.dart';
import '../viewmodel/book_list_provider.dart';
import '../widgets/book_list_card.dart';

class BookListScreen extends ConsumerStatefulWidget {
  const BookListScreen({super.key});

  @override
  ConsumerState<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends ConsumerState<BookListScreen> {
  final ScrollController _scrollController = ScrollController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_onScroll);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }

      _debounce = Timer(const Duration(milliseconds: 300), () {
        ref.read(booksProvider.notifier).loadMore();
      });
    }
  }

  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _debounce?.cancel();
    _scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(booksProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F0FF),
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        backgroundColor: ColorManager.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Book List',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorManager.whiteColor,
            letterSpacing: 0.3,
          ),
        ),
      ),
      body: RefreshIndicator(
        color: ColorManager.primaryColor,
        onRefresh: () async {
          await ref.read(booksProvider.notifier).refresh();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: TextFormField(
                controller: controller,
                decoration: textFormDecoration(
                  ref: ref,
                  query: controller.text.trim(),
                ),
              ),
            ),
            Expanded(
              child: state.when(
                data: (data) {
                  log("BooK Quantity :${data.books.length}");

                  if (data.books.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.menu_book_outlined,
                            size: 64,
                            color: ColorManager.primaryColor.withOpacity(0.3),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'No books found',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF49454F),
                            ),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: ColorManager.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () async {
                              await ref.read(booksProvider.notifier).refresh();
                            },
                            icon: const Icon(
                              Icons.refresh_rounded,
                              color: ColorManager.whiteColor,
                            ),
                            label: const Text(
                              'Try Again',
                              style: TextStyle(
                                color: ColorManager.whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(14, 18, 14, 18),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                    itemCount: data.books.length + (data.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == data.books.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final book = data.books[index];
                      return BookListCard(book: book, ref: ref);
                    },
                  );
                },
                error: (e, _) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.wifi_off_rounded,
                            size: 56,
                            color: ColorManager.primaryColor.withOpacity(0.35),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            e.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF49454F),
                            ),
                          ),
                          const SizedBox(height: 24),
                          FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: ColorManager.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () async {
                              await ref.read(booksProvider.notifier).refresh();
                            },
                            icon: const Icon(
                              Icons.refresh_rounded,
                              color: ColorManager.whiteColor,
                            ),
                            label: const Text(
                              'Try Again',
                              style: TextStyle(
                                color: ColorManager.whiteColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFormDecoration({required WidgetRef ref, String? query}) {
    return InputDecoration(
      hintText: 'Search books, authors…',
      //prefixIcon: const Icon(Icons.search_rounded, color: Color(0xFF6750A4)),
      suffixIcon: IconButton(
        onPressed: () {
          log(query??'nai');
          if (query != null && query.isNotEmpty) {
             ref.read(booksProvider.notifier).fetchInitial(query: query);
          }
        },
        icon: Icon(Icons.search, size: 34, color: ColorManager.primaryColor),
      ),
      filled: true,
      fillColor: const Color(0xFFF3EDF7),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFF6750A4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFFCAC4D0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: Color(0xFF6750A4), width: 2),
      ),
    );
  }
}
