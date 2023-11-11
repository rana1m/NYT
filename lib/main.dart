import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:new_york_times/routes/routes.dart';
import 'package:new_york_times/services/api.dart';
import 'package:new_york_times/view/articles_screen.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerLazySingleton<Api>(() => Api(Dio()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ArticlesListScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
