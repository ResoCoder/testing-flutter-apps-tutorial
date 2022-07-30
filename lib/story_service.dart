import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_testing_tutorial/post.dart';

// A Story service to simulate communication with a server.

class StoryService {
  // This simulates a remote database
  final _posts = List.generate(
    10,
    (_) => Post(
      title: lorem(paragraphs: 1, words: 3),
      content: lorem(paragraphs: 10, words: 500),
    ),
  );

  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _posts;
  }
}
