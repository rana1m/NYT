// Articles_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_york_times/bloc/articles_bloc.dart';
import 'package:new_york_times/bloc/articles_event.dart';
import 'package:new_york_times/bloc/articles_state.dart';
import 'package:new_york_times/data/articles_list.dart';
import 'package:new_york_times/view/widgets/articles_list_widget.dart';

class ArticlesListScreen extends StatefulWidget {
  static const String id = "Articles_list_screen";
  const ArticlesListScreen({super.key});

  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  late ArticlesBloc _articlesBloc;
  late List<Results>? _articlesList;

  @override
  void initState() {
    _articlesBloc = BlocProvider.of(context);
    _articlesBloc.add(ArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("e"),
      ),
      body: BlocConsumer<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          if (state is ArticlesPageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticlesPageLoaded) {
            if (state.articlesList.results?.isNotEmpty == true) {
              _articlesList = state.articlesList.results;
              return ArticlesListWidget(articlesList: _articlesList);
            } else {
              return const Center(child: Text("No Data"));
            }
          } else if (state is ArticlesPageError) {
            return Text(state.errorMessage);
          }
          return const Center(child: Text("Somthing went wrong!"));
        },
        listener: (context, state) {
          //Here, you can permorn action like show toast, snackbar & dialog on the basis of state
        },
      ),
    );
  }
}
