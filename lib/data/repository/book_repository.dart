import '../models/book_list_model.dart';
import '../sources/remote/book_api_services.dart';

class BookRepository {
  final BookApiServices remote;
  BookRepository({required this.remote});
  Future<List<BookModel>?> getBookFromGoogleApi({required int page}) async {
    return await remote.getBookFromGoogleApi(page: page);
  }
}
