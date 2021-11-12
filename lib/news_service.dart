import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_testing_tutorial/article.dart';

/// A News service simulating communication with a server.
class NewsService {
  // Simulating a remote database
  final _articles = List.generate(
    10,
    (_) => Article(
      title: lorem(paragraphs: 1, words: 3),
      content: lorem(paragraphs: 10, words: 500),
    ),
  );

  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _articles;
  }
}
