import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/bloc/articles_event.dart';
import 'package:new_york_times/bloc/articles_state.dart';
import 'package:new_york_times/data/articles_list.dart';
import 'package:new_york_times/repository/articles_repo.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  //Articles repo instance
  final _articlesRepo = ArticlesRepo();

  ArticlesBloc() : super(ArticlesInitial()) {
    on<ArticlesEvent>(fetchArticlesList);
  }

  FutureOr<void> fetchArticlesList(ArticlesEvent event, Emitter<ArticlesState> emit) async {
    emit(ArticlesPageLoading());
    await _articlesRepo
        .getArticles(
          "all-sections",
          "7.json",
          "v0DjuAS9659v9TxLgsREBRF3dJz46evq",
        )
        .onError(
          (error, stackTrace) => emit(
            ArticlesPageError(
              error.toString(),
            ),
          ),
        )
        .then((value) {
      ArticlesList articlesList = ArticlesList.fromJson(value);
      if (articlesList.status == "OK") {
        emit(ArticlesPageLoaded(articlesList));
      }
    });
  }
}
