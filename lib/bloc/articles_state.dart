import 'package:new_york_times/data/articles_list.dart';

abstract class ArticlesState {}

//initial state of bloc
class ArticlesInitial extends ArticlesState {}

//loading state of bloc
class ArticlesPageLoading extends ArticlesState {}

//success state of bloc
class ArticlesPageLoaded extends ArticlesState {
  late final ArticlesList articlesList;
  ArticlesPageLoaded(this.articlesList);
}

//error state of bloc
class ArticlesPageError extends ArticlesState {
  late final String errorMessage;
  ArticlesPageError(this.errorMessage);
}
