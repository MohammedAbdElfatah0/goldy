import 'package:dio/dio.dart';
import 'package:goldy/core/networking/api_constant.dart';

class DioHelper {
  //header
  static final header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };


  static late Dio dio;
  
  
  //init dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: header,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
