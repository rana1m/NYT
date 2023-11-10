abstract class IArticlesRepo {
  Future<dynamic> getArticles(
    String section,
    String period,
    String apiKey,
  );
}
