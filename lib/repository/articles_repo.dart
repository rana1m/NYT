import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_york_times/repository/i_articles_repo.dart';
import 'package:new_york_times/services/api.dart';

class ArticlesRepo implements IArticlesRepo {
  final Api _api = GetIt.instance.get();

  @override
  Future<dynamic> getArticles(
    String section,
    String period,
    String apiKey,
  ) async {
    try {
      final Response response = await _api.getArticles(section, period, apiKey);
      return response.data;
    } catch (error) {
      return error;
    }
  }
}
