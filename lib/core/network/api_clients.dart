import 'package:astha_it_assessment/core/network/response_handler.dart';
import 'package:dio/dio.dart';
import '../../app_config.dart';
import 'error_handler.dart';

class APIClients {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,

      connectTimeout: const Duration(seconds: 15),

      sendTimeout: const Duration(seconds: 15),

      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  Future<dynamic> getRequest({required String endpoints}) async {
    try {

      final response = await _dio.get(
        '/$endpoints',

        options: Options(headers: {"Content-Type": "application/json"}),
      );

      return ResposeHandle.handleResponse(response);
    } on DioException catch (e) {
      throw ErrorHandle.handleDioError(e);
    } catch (e) {
      throw "Something went wrong";
    }
  }
}
