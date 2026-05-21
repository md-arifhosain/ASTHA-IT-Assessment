import 'package:dio/dio.dart';

import 'api_endpoinds.dart';

class APIClients {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIEndpoinds.baseURL,
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  /// GET request
  Future<dynamic> getRequest({
    required String endpoints,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        '/$endpoints',
        queryParameters: queryParameters,
      );
    } catch (e) {
      if (e is DioException) {
      } else {}
    }
  }
}
