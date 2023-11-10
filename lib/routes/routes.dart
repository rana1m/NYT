import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/bloc/articles_bloc.dart';
import 'package:new_york_times/view/articles_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ArticlesListScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<ArticlesBloc>.value(
            value: ArticlesBloc(),
            child: const ArticlesListScreen(),
          ),
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
