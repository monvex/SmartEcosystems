import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:smartecosystems/core/model/failure.dart';

class ApiClient {
  final Dio _dio;
  final CookieJar _cookieJar;

  ApiClient({required String baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 3),
        ),
      ),
      _cookieJar = CookieJar() {
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    try {
      return await _dio.get(path, queryParameters: params, options: options);
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Unexpected error: $e');
    }
  }

  Future<Response> post(String path, {dynamic data, Options? options}) async {
    try {
      return await _dio.post(path, data: data, options: options);
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Unexpected error: $e');
    }
  }

  Future clearCookies() async {
    await _cookieJar.deleteAll();
  }

  Failure _handleError(DioException e) {
    if (e.response != null) {
      return ServerFailure(
        errorMessage: e.response?.data['message'] ?? 'Server error',
        statusCode: e.response?.statusCode,
      );
    } else {
      return NetworkFailure(errorMessage: 'Network error: ${e.message}');
    }
  }
}
