import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:new_york_times/bloc/articles_bloc.dart';
import 'package:new_york_times/bloc/articles_state.dart';
import 'package:new_york_times/data/articles_list.dart';
import 'package:new_york_times/repository/articles_repo.dart';
import 'package:new_york_times/services/api.dart';

// Mock class for the ArticlesRepo
class MockArticlesRepo extends Mock implements ArticlesRepo {}

void main() {
  GetIt locator = GetIt.instance;
  locator.registerLazySingleton<Api>(() => Api(Dio()));
  ArticlesBloc articlesBloc = ArticlesBloc();
  MockArticlesRepo mockArticlesRepo = MockArticlesRepo();

  test('fetchArticlesList emits ArticlesPageLoaded when successful', () async {
    final articlesList = ArticlesList();

    when(mockArticlesRepo.getArticles("any", "any", "any")).thenAnswer((_) async => Future.value(articlesList));

    final expectedStates = [
      ArticlesPageLoading(),
      ArticlesPageLoaded(articlesList),
    ];

    expectLater(
      articlesBloc.stream,
      emitsInOrder(expectedStates),
    );
  });

  test('fetchArticlesList emits ArticlesPageError when an error occurs', () async {
    final fakeError = Exception('error');

    when(mockArticlesRepo.getArticles("", "", "")).thenThrow(fakeError);

    final expectedStates = [
      ArticlesPageLoading(),
      ArticlesPageError(fakeError.toString()),
    ];

    expectLater(
      articlesBloc.stream,
      emitsInOrder(expectedStates),
    );
  });
}
