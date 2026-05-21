import 'package:astha_it_assessment/core/network/api_clients.dart';
import 'package:astha_it_assessment/core/network/api_endpoinds.dart';
import 'package:astha_it_assessment/data/models/book_list_model.dart';

class BookApiServices {
  APIClients apiClients;
  BookApiServices({required this.apiClients});
  Future<BookModel> getBookFromGoogleApi({required int page}) async {
    try {
      final response = await apiClients.getRequest(
        endpoints:
            "${APIEndpoinds.volumes}?q=flutter&startIndex=$page&maxResults=10&key=${APIEndpoinds.key}",
      );
      return BookModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
