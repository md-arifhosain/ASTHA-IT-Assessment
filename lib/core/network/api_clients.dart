import 'dart:developer';
import 'package:dio/dio.dart';
import '../../app_config.dart';
import 'error_handler.dart';
import 'response_handler.dart' show ResposeHandle;

class APIClients {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  /// GET request
  Future<dynamic> getRequest({
    required String endpoints,
   
  }) async {
    try {
        log("\n\n\n\nurl :${AppConfig.baseUrl}/$endpoints \n\n\n\n");
      final response = await _dio.get(
        '/$endpoints',
         options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
       return ResposeHandle.handleResponse(response);
    } catch (e) {
      if (e is DioException) {
         ErrorHandle.handleDioError(e);
      } else {}
    }
  }
}
