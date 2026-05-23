import 'dart:developer';

import 'package:astha_it_assessment/core/network/api_clients.dart';
import 'package:astha_it_assessment/core/network/api_endpoinds.dart';
import 'package:astha_it_assessment/data/models/book_list_model.dart';

class BookApiServices {
  APIClients apiClients;
  BookApiServices({required this.apiClients});
  Future<List<BookModel>?> getBookFromGoogleApi({
    required int page,
    String? query,
  }) async {
    try {
      String currentQuery = 'flutter';
      if (query != null && query.isNotEmpty) {
        currentQuery = query;
      }
      log("query :$currentQuery");
      final response = await apiClients.getRequest(
        endpoints:
            "${APIEndpoinds.volumes}?q=flutter&startIndex=$page&maxResults=10&key=${APIEndpoinds.key}",
      );
      if (response != null) {
        List<BookModel> bookList = [];
        for (final item in response['items']) {
          bookList.add(BookModel.fromJson(item));
        }
        return bookList;
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
