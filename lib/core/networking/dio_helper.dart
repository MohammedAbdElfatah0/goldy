import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constant.dart';

class DioHelper {
  static late Dio dio;

  //init dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {"Accept": "application/json", "User-Agent": "Mozilla/5.0"},//!  Add user agent
      ),
    );

    // Add retry interceptor for rate limiting
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
