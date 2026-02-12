import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constant.dart';
import 'package:goldy/core/networking/network_service.dart';

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
        headers: {
          "Accept": "application/json",
          "User-Agent": "Mozilla/5.0",
        }, //!  Add user agent
      ),
    );

    // Add retry interceptor for rate limiting
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    int retryCount = 3,
  }) async {
    // Check internet connection first
    if (!await NetworkService.isConnected()) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        type: DioExceptionType.unknown,
        error: 'No internet connection',
      );
    }

    int attempts = 0;
    DioException? lastException;

    while (attempts < retryCount) {
      try {
        return await dio.get(url, queryParameters: query);
      } catch (e) {
        attempts++;
        lastException = e as DioException;

        // Don't retry if it's a 4xx error (client error)
        if (lastException.response?.statusCode != null &&
            lastException.response!.statusCode! >= 400 &&
            lastException.response!.statusCode! < 500) {
          rethrow;
        }

        // Wait before retry (exponential backoff)
        if (attempts < retryCount) {
          await Future.delayed(Duration(seconds: attempts * 2));
        }
      }
    }

    throw lastException!;
  }
}
