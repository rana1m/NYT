import 'dart:async';
import 'package:dio/dio.dart';

class Api {
  static const String baseURL = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed";
  final Dio _dio;
  Api(Dio dio) : _dio = dio;

  Future<Response> getArticles(
    String section,
    String period,
    String apiKey,
  ) {
    return _dio.get(
      '$baseURL/$section/$period',
      queryParameters: {
        'api-key': apiKey,
      },
    );
  }
}
