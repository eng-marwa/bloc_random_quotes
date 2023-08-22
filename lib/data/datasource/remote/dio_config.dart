import 'package:dio/dio.dart';
import 'package:p11/utils/constants.dart';

class Config {
  static Dio getDio() {
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(
        LogInterceptor(error: true, requestHeader: true, responseBody: true));
    return dio;
  }
}
