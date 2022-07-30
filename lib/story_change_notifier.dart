import 'package:flutter/material.dart';
import 'package:flutter_testing_tutorial/post.dart';
import 'package:flutter_testing_tutorial/story_service.dart';

class StoryChangeNotifier extends ChangeNotifier {
  final StoryService _storyService;

  StoryChangeNotifier(this._storyService);

  List<Post> _posts = [];

  List<Post> get posts => _posts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getPosts() async {
    _isLoading = true;
    notifyListeners();
    _posts = await _storyService.getPosts();
    _isLoading = false;
    notifyListeners();
  }
}
