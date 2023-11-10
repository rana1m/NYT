import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_york_times/bloc/articles_bloc.dart';
import 'package:new_york_times/bloc/articles_event.dart';
import 'package:new_york_times/bloc/articles_state.dart';
import 'package:new_york_times/view/articles_screen.dart';
import 'package:mockito/mockito.dart';

// Mock class for the ArticlesBloc
class MockArticlesBloc extends MockBloc<ArticlesEvent, ArticlesState> implements ArticlesBloc {}

void main() {
  group('ArticlesListScreen', () {
    MockArticlesBloc mockArticlesBloc = MockArticlesBloc();

    testWidgets('renders CircularProgressIndicator when loading', (WidgetTester tester) async {
      when(mockArticlesBloc.state).thenReturn(ArticlesPageLoading());

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<ArticlesBloc>.value(
              value: mockArticlesBloc,
              child: ArticlesListScreen(),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
