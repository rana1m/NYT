import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/bloc/articles_bloc.dart';
import 'package:new_york_times/data/articles_list.dart';
import 'package:new_york_times/view/artical_details_screen.dart';
import 'package:new_york_times/view/articles_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case ArticlesListScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ArticlesBloc>.value(
            value: ArticlesBloc(),
            child: const ArticlesListScreen(),
          ),
        );
      case ArticleDetailScreen.id:
        return MaterialPageRoute(
          builder: (context) {
            return ArticleDetailScreen(articleData: args as Results);
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
