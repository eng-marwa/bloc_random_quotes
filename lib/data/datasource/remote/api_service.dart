import 'package:dio/dio.dart';
import 'package:p11/data/model/random_quote.dart';
import 'dio_config.dart';

class ApiService {
  ApiService._();

  static final ApiService api = ApiService._();

  Future<RandomQuote> fetchRandomQuote() async {
    String endPoint = 'random';
    Dio dio = Config.getDio();
    Response response = await dio.get(endPoint);
    if (response.statusCode == 200) {
      return RandomQuote.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch random quote');
    }
  }
}
